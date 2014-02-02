require "test_helper"

feature "CheckForZurb" do
  scenario "the page has columns" do
    visit root_path
    page.must_have_content "columns"
  end
end
