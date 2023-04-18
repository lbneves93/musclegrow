# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.role?' do
    let(:admin_user) { create(:user) }
    let(:athlete_user) { create(:user, :athlete) }

    it { expect(admin_user.admin?).to be_truthy }
    it { expect(athlete_user.athlete?).to be_truthy }
  end
end
