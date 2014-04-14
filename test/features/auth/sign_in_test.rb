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

feature("As a Twitter user, I want to be able to use my Twitter credentials
    to sign in so that I can view and participate in the site.") do

  scenario "sign in with Twitter works" do
    visit root_path
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    OmniAuth.config.add_mock(:twitter,
                    {
                    uid: '12345',
                    info: { username: 'test_twitter_user'},
                    })

    click_on "Sign in with Twitter"
    page.must_have_content "test_twitter_user, you are signed in!"
  end

end
