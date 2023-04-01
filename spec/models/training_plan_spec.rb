require 'rails_helper'

RSpec.describe TrainingPlan, type: :model do
  let(:training_plan) { build(:training_plan) }

  describe 'validations' do
    it 'returns valid training_plan' do
      expect(training_plan.valid?).to be_truthy
    end
  end
end
