require "test_helper"

feature "Commenting On A Post" do
   scenario "submit comments on an existing post" do
     # Given an existing post, I want to write a comment from a blog post page
     # so that I can troll the author
     sign_in
     visit new_post_path
     fill_in "Title", with: posts(:cr).title
     fill_in "Body", with: posts(:cr).body
     check "Published"
     click_on "Create Post"

     # When I submit comment data on the existing post
     fill_in "Your name", with: comments(:lana).author
     fill_in "Your email", with: comments(:lana).author_email
     fill_in "Your URL", with: comments(:lana).author_url
     fill_in "Your Comment", with: comments(:lana).content

     # When I submit the form
     click_on "Submit comment for approval"

     # Then the post is updated and awaits moderation
     page.text.must_include "This comment is awaiting moderation"
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
    # the checkbox needs to be verified on the form
    # check "Published"
    click_on "Create Post"

    # Then the approved post should be shown
    page.text.must_include "Status: Unpublished"
    visit posts_path
  end

  scenario "editors can approve" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for approval
     page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    # this approval functionality is pending
    # check "Approve"
    check "Published"
    click_on "Create Post"
    #click_on "Update"

    # Then the approved post should be shown
    page.text.must_include "Status: Published"
    visit posts_path
  end
end
