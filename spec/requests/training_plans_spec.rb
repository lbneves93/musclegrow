require 'rails_helper'

RSpec.describe 'Training Plans', type: :request do
  describe 'UPDATE training_plan' do
    let(:training_plan) { create(:training_plan) }
    
    let(:first_category) { create(:exercise_category, name: 'Biceps') }
    let(:first_exercise) { create(:exercise, name: 'Biceps curls', exercise_category: first_category) }
    
    let(:second_category) { create(:exercise_category, name: 'Leg') }
    let(:second_exercise) { create(:exercise, name: 'Leg press', exercise_category: second_category) }

    let(:params) do
      {
        id: training_plan.id,
        description: 'My training',
        training_plan: {
          training_schedules: training_schedules_param
        }
      }
    end

    context 'when has not training schedules and create first one' do
      let(:training_schedules_param) { [{ week_day: 0, exercise_names: [first_exercise.name].to_s}] }
      
      before { put (training_plan_path(params)) }
      
      it { expect(response).to have_http_status(:found) }

      it 'updates traning_plan creating first training_schedule' do
        expect(training_plan.training_schedules.count).to eq(1)
      end
    end

    context 'when has training schedule for sunday and add more exercises' do
      let(:training_schedules_param) { [{ week_day: 0, exercise_names: [first_exercise.name, second_exercise.name].to_s}] }

      before do
        create(:training_schedule, training_plan: training_plan, week_day: 0, exercise: first_exercise)
        put (training_plan_path(params))
      end

      it { expect(response).to have_http_status(:found) }

      it 'updates training_plan adding second exercise on sunday' do
        expect(TrainingSchedule.find_by(week_day: 0, exercise_id: second_exercise.id)).not_to be_nil
      end

      it 'keeps first exercise on sunday' do
        expect(TrainingSchedule.find_by(week_day: 0, exercise_id: first_exercise.id)).not_to be_nil
      end
    end

    context 'when has training schedule for sunday and add schedule for monday too' do
      let(:training_schedules_param) do 
        [
          { week_day: 0, exercise_names: [first_exercise.name].to_s },
          { week_day: 1, exercise_names: [second_exercise.name].to_s }
        ]
      end

      before do
        create(:training_schedule, training_plan: training_plan, week_day: 0, exercise: first_exercise)
        put (training_plan_path(params))
      end

      it { expect(response).to have_http_status(:found) }

      it 'updates training_plan adding second exercise on monday' do
        expect(TrainingSchedule.find_by(week_day: 1, exercise_id: second_exercise.id)).not_to be_nil
      end

      it 'keeps first exercise on sunday' do
        expect(TrainingSchedule.find_by(week_day: 0, exercise_id: first_exercise.id)).not_to be_nil
      end
    end

    context 'when has training schedule for sunday and remove all exercises for this day' do
      let(:training_schedules_param) { [{ week_day: 1, exercise_names: [second_exercise.name].to_s }] }

      before do 
        create(:training_schedule, training_plan: training_plan, week_day: 0, exercise: first_exercise)
        put (training_plan_path(params))
      end

      it { expect(response).to have_http_status(:found) }

      it 'updates training_plan adding exercise on monday' do
        expect(TrainingSchedule.find_by(week_day: 1, exercise_id: second_exercise.id)).not_to be_nil
      end

      it 'removes exercise on sunday' do
        expect(TrainingSchedule.find_by(week_day: 0)).to be_nil
      end
    end
  end
end