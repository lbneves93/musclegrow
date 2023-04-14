require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'LIST home' do
    subject(:get_home) { get root_path }

    context 'when has not exercises' do
      before { get_home }

      it { expect(response).to have_http_status(:success) }

      it 'returns empty' do
        expect(assigns(:exercises)).to be_empty
      end
    end

    context 'when has exercises' do
      before do
        first_category = create(:exercise_category, name: 'Leg')
        second_category = create(:exercise_category, name: 'Chest')
        create(:exercise, name: 'Squat', exercise_category: first_category)
        create(:exercise, name: 'Bench Press', exercise_category: second_category)
        create(:exercise, name: 'Bench Press Inclined', exercise_category: second_category)
        get_home
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns 3 exercises' do
        expect(assigns(:exercises).count).to eq(3)
      end
    end

    context 'when has not training plan' do
      before { get_home }

      it { expect(response).to have_http_status(:success) }

      it 'returns created empty training_plan' do
        expect(assigns(:training_plan).id).to eq(TrainingPlan.last.id)
      end
    end

    context 'when has many training plans' do
      let(:first_training_plan) do 
        create(:training_plan, :with_schedule, description: 'first', category_name: 'Leg', exercise_name: 'Squat', user: user)
      end

      let(:second_training_plan) do 
        create(:training_plan, :with_schedule, description: 'second', category_name: 'Chest', exercise_name: 'Bench Press', user: user)
      end
      
      before do
        first_training_plan
        second_training_plan
        get_home
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns last training_plan' do
        expect(assigns(:training_plan).id).to eq(TrainingPlan.last.id)
      end
    end

    context 'when has training plans from many users' do
      let(:first_user_training_plan) do 
        create(:training_plan, :with_schedule, description: 'first', category_name: 'Leg', exercise_name: 'Squat', user: user)
      end

      let(:second_user_training_plan) do 
        create(:training_plan, :with_schedule, description: 'second', category_name: 'Chest', exercise_name: 'Bench Press')
      end
      
      before do
        first_user_training_plan
        second_user_training_plan
        get_home
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns last training_plan' do
        expect(assigns(:training_plan).id).to eq(first_user_training_plan.id)
      end
    end
  end
end