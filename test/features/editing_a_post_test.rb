require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    visit new_post_path
    page.must_have_content "Edit"
  end
end
