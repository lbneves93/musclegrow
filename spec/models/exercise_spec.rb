# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) { build(:exercise) }

  describe 'validations' do
    it 'returns valid exercise' do
      expect(exercise.valid?).to be_truthy
    end

    context 'when name is empty' do
      let(:exercise) { build(:exercise, name: '') }

      it 'returns invalid exercise' do
        expect(exercise.valid?).to be_falsey
      end
    end

    context 'when img_url is empty' do
      let(:exercise) { build(:exercise, img_url: '') }

      it 'returns invalid exercise' do
        expect(exercise.valid?).to be_falsey
      end
    end

    context 'when exercise name already exists' do
      before { create(:exercise, name: 'Bench Press') }

      let(:exercise) { build(:exercise, name: 'bench Press') }

      it 'returns invalid exercise' do
        expect(exercise.valid?).to be_falsey
      end
    end
  end
end
