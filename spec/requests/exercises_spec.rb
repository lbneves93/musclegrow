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
        create(:exercise, name: 'Squat', exercise_category: exercise_category)
        create(:exercise, name: 'Leg Press', exercise_category: exercise_category)
        create(:exercise, name: 'Leg Extension', exercise_category: exercise_category)
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns 3 exercises' do
        expect(assigns(:exercises).count).to eq(3)
      end
    end
  end
end