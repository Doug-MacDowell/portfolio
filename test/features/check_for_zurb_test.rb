require "test_helper"

feature "CheckForZurb" do
  scenario "the page has columns" do
    visit root_path
    page.body.must_include "columns"
  end
end
