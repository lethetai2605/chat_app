require "rails_helper"

RSpec.feature "Create Room", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
  end
  scenario "valid input" do
  end
end
