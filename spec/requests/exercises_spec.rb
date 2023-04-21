# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Exercises', type: :request do
  describe 'LIST exercises' do
    before { get exercises_path }

    context 'when has not exercises' do
      it { expect(response).to have_http_status(:success) }

      it 'returns empty' do
        expect(assigns(:exercises)).to be_empty
      end
    end

    context 'when has exercises' do
      let(:exercise_category) { create(:exercise_category, name: 'Leg') }

      before do
        create(:exercise, name: 'Squat', exercise_category:)
        create(:exercise, name: 'Leg Press', exercise_category:)
        create(:exercise, name: 'Leg Extension', exercise_category:)
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns 3 exercises' do
        expect(assigns(:exercises).count).to eq(3)
      end
    end
  end

  describe 'CREATE exercise' do
    before { sign_in admin_user }

    let(:exercise_category_id) { create(:exercise_category).id }
    let(:exercise_name) { 'Treadmill' }
    let(:exercise_img_url) { FFaker::Image.url }

    let(:params) do
      {
        exercise: {
          name: exercise_name,
          img_url: exercise_img_url,
          exercise_category_id:
        }
      }
    end

    context 'with valid params' do
      it 'returns http status 201' do
        post exercises_path(params)
        expect(response).to have_http_status(:created)
      end

      it 'creates exercise with success' do
        expect { post exercises_path(params) }.to change(Exercise, :count).by(1)
      end
    end

    context 'with name blank' do
      let(:exercise_name) { '' }

      it 'returns http status 422' do
        post exercises_path(params)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'not creates exercise' do
        expect { post exercises_path(params) }.not_to change(Exercise, :count).from(0)
      end
    end

    context 'with name img_url blank' do
      let(:exercise_img_url) { '' }

      it 'returns http status 422' do
        post exercises_path(params)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'not creates exercise' do
        expect { post exercises_path(params) }.not_to change(Exercise, :count).from(0)
      end
    end

    context 'without exercise_category_id' do
      let(:exercise_category_id) { nil }

      it 'returns http status 422' do
        post exercises_path(params)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'not creates exercise' do
        expect { post exercises_path(params) }.not_to change(Exercise, :count).from(0)
      end
    end

    context 'when exercise already exists' do
      before do
        create(:exercise, name: exercise_name, img_url: exercise_img_url, exercise_category_id:)
      end

      it 'returns http status 422' do
        post exercises_path(params)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when current user is not an admin' do
      before { sign_in athlete_user }

      it 'raises CanCan::AccessDenied exception' do
        expect { post exercises_path(params) }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
