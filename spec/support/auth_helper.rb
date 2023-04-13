RSpec.configure do |config|
  config.before type: :request do
    sign_in user
  end
end

def user
  @user ||= create(:user)
end