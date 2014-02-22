require "test_helper"

feature("As a registered user I want to be able to sign in so
    that I can view the site as myself.") do

  scenario "sign in" do
    # Given a sign-in link on the main page
    visit root_path
    click_on "Sign In"

    # When I sign in with valid info
    fill_in "Email", with: users(:test).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    # Then I should be signed in
    page.must_have_content "Signed in successfully"
  end
end
