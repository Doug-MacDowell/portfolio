require "test_helper"

feature "Commenting On A Post" do
  scenario "submit comments on an existing post" do
    # Given an existing post, I want to write a comment from a blog post page
    # so that I can troll the author
    sign_in
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)

    # When I click comment and submit changed data
    fill_in "Your Comment", with: "So you think you are a Web Developer!"
    click_on "Submit comment for approval"

    # Then the post is updated
    page.text.must_include "This comment is awaiting moderation"
    page.text.must_include "Web Developer"
  end

end

feature "Approving A Post" do
  scenario "authors can approve" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new post
    visit new_post_path

    # There is a checkbox for approval
    # page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    # Then the approved post should be shown
    page.text.must_include "Status: Published"
    visit posts_path
  end

  scenario "editors can approve" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for approval
     page.must_have_field('Approve')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Approve"
    click_on "Approve Post"

    # Then the approved post should be shown
    # page.text.must_include "Status: Published"
    visit posts_path
  end
end
