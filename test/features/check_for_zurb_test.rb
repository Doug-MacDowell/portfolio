require "test_helper"

feature "CheckForZurb" do
#  Capybara.ignore_hidden_elements = false
  scenario "the page has columns" do
    visit root_path
    page.must_have_content "columns"
  end
end
