require "test_helper"

feature "Deleting A Post" do
  scenario "the post is deleted with a click" do
    visit new_post_path
    page.must_have_content "Destroy"
    page.wont_have_content "Delete"
  end
end
