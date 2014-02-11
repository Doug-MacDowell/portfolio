require "test_helper"

#feature "Projects::CreatingAProject" do
feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding new projects" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "Doug MacDowell Portfolio"
    fill_in "Technologies used", with: "Ruby, Rails, HTML5, CSS3"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Doug MacDowell's Portfolio"
    page.text.must_include "Rails"
  end
end
