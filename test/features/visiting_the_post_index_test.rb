require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do
    visit new_post_path
    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
#   fill_in "Title", with: "Code Rails"
#Given existing posts

# When I visit /posts
  visit posts_path

# Then the existing posts should be loaded
  page.text.must_include "Becoming a Code Fellow"

  end
end

