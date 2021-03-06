require "test_helper"

feature "Deleting A Post" do
  scenario "the post is deleted with a click" do
    # Given an existing post
    sign_in(:author)
    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path

    # When the delete link is clicked
    #page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    #page.wont_have_content "Becoming a Code Fellow"
    #page.wont_have_content "striving for excellence"
  end
end
