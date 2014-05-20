require "test_helper"

feature "User Mailer Test" do
  scenario "submit form data to create a new message" do
    # When I visit /messages
    visit new_message_path

    # Then the existing posts should be loaded
    fill_in "Your name", with: comments(:lana).author_email
    fill_in "Your email", with: comments(:lana).author_email
    fill_in "Your message", with: comments(:lana).content

    # When I submit the form
    click_on "Submit your message"
    page.text.must_include "Message sent! Thanks for contacting us."
  end
end
