require "test_helper"

feature "Deleting A Post" do
  scenario "the post is deleted with a click" do
    # Given an existing post
#    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path

    # When the delete link is clicked
    click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end
