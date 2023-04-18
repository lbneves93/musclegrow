# frozen_string_literal: true

RSpec.configure do |config|
  config.before type: :request do
    sign_in athlete_user
  end
end

def admin_user
  @admin_user ||= create(:user)
end

def athlete_user
  @athlete_user ||= create(:user, :athlete)
end
