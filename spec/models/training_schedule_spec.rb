# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrainingSchedule, type: :model do
  let(:training_schedule) { build(:training_schedule) }

  describe 'validations' do
    it 'returns valid training_schedule' do
      expect(training_schedule.valid?).to be_truthy
    end

    context 'when week_day is empty' do
      let(:training_schedule) { build(:training_schedule, week_day: '') }

      it 'returns invalid training_schedule' do
        expect(training_schedule.valid?).to be_falsey
      end
    end

    context 'when week_day is number out of range' do
      let(:training_schedule) { build(:training_schedule, week_day: 7) }

      it 'returns invalid training_schedule' do
        expect(training_schedule.valid?).to be_falsey
      end
    end
  end
end
