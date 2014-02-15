require "test_helper"

feature "As the site owner, I want to add a project so that I can correct typos" do
  scenario "editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:portfolio))
    # When I make changes
    fill_in "Name", with: "My Portfolio"
    click_on "Update Project"
    # Then the changes should be saved and displayed
    page.text.must_include "success"
    page.text.must_include "My Portfolio"
    page.text.wont_include "Some Other Portfolio"
  end

  scenario "incorrectly editing an existing project" do
# Given an existing project
    visit edit_project_path(projects(:portfolio))
# When I submit invalid changes
    fill_in "Name", with: "Opi"
    click_on "Update Project"
# Then the changes should not be saved, and I should get to try again
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end
