require "rails_helper"

describe "User signs in", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
  end

  scenario "valid with correct credentials" do
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button "Log in"

    expect(page).to have_text "Welcome to the RailsChat!"
    expect(page).to have_link "Logout"
    expect(page).to have_current_path root_path
  end

  scenario "invalid with unregistered account" do
    fill_in "user[email]", with: nil
    fill_in "user[password]", with: @user.password
    click_button "Log in"

    expect(page).to have_no_text "Login"
    # expect(page).to have_text "Invalid Email or password."
    expect(page).to have_no_link "Logout"
  end

  scenario "invalid with invalid password" do
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: "FakePassword123"
    click_button "Log in"

    expect(page).to have_no_text "Login"
    # expect(page).to have_text "Invalid Email or password."
    expect(page).to have_no_link "Logout"
  end
end
