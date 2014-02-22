require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    sign_in
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit edit_post_path(post)

    # When I click edit and submit changed data
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
