require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do
    visit new_post_path
# disabling this test because it is superceded
#    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")

# When I visit /posts
  visit posts_path

# Then the existing posts should be loaded
#  page.text.must_include "Means striving for excellence."

  end
end

