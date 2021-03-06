require "test_helper"

feature("As a site visitor I want to be able to sign up for an account
  so that I can perform actions that require me to be logged in.") do

  scenario "sign up" do
    # Given a registration form
    visit root_path
    click_on "Sign Up"

    # When I register with valid info
    fill_in "Email", with: "dude@test.com"
    fill_in "Password", with: "pass&word"
    fill_in "Password confirmation", with: "pass&word"
    click_on "Sign up"

    # Then I should be signed in
    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up"
  end
end
