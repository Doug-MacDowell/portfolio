require "test_helper"

feature("As a site visitor I want to be able to sign out link so
    that my login session is destroyed.") do

  scenario "sign out" do
    # Given a registration form
    visit root_path
    click_on "Sign In"

    # When I register with valid info
    fill_in "Email", with: users(:test).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    visit "/"
    click_on "Sign Out"

    # Then I should be signed in
    page.must_have_content "Signed out successfully"
  end
end
