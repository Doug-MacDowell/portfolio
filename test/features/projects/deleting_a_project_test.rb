require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "deleting a project" do

    # Given an existing project
    doomed = Project.create(name: "Doomed Project", technologies_used: "Chewing gum and bailing wire.")
    visit project_path(doomed)

    # When the delete link is clicked
      first(:link, 'Destroy').click

    # Then the post is deleted
    page.wont_have_content "Doomed Project"

  end
end
