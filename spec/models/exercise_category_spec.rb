# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExerciseCategory, type: :model do
  let(:exercise_category) { build(:exercise_category) }

  describe 'validations' do
    it 'returns valid exercise_category' do
      expect(exercise_category.valid?).to be_truthy
    end

    context 'when name is empty' do
      let(:exercise_category) { build(:exercise_category, name: '') }

      it 'returns invalid exercise_category' do
        expect(exercise_category.valid?).to be_falsey
      end
    end

    context 'when img_url is empty' do
      let(:exercise_category) { build(:exercise_category, img_url: '') }

      it 'returns invalid exercise_category' do
        expect(exercise_category.valid?).to be_falsey
      end
    end

    context 'when category name already exists' do
      before { create(:exercise_category, name: 'Chest') }

      let(:exercise_category) { build(:exercise_category, name: 'chest') }

      it 'returns invalid exercise_category' do
        expect(exercise_category.valid?).to be_falsey
      end
    end
  end
end
