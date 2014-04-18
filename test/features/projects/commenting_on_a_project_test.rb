require "test_helper"

feature "Commenting On A Project" do
   scenario "submit comments on an existing project" do
     # Given an existing project, I want to write a comment from a blog page
     # so that I can troll the author
     sign_in
     visit new_project_path
     fill_in "Name", with: projects(:portfolio).name
     fill_in "Technologies used", with: projects(:portfolio).technologies_used
     click_on "Create Project"

     # When I submit comment data on the existing project
     visit project_path(projects(:portfolio))

     # the remaining items below are ready but will not work until
     # I add a Comments form to projects
     # Handy little tool to see things: save_and_open_page

     fill_in "Your name", with: comments(:jack).author
     fill_in "Your email", with: comments(:jack).author_email
     fill_in "Your URL", with: comments(:jack).author_url
     fill_in "Your Comment", with: comments(:jack).content

     # When I submit the form
     click_on "Submit comment for approval"

     # Then the post is updated and awaits moderation
     page.text.must_include "This comment is awaiting moderation"
   end
end
