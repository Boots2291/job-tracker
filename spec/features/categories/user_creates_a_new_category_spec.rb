require 'rails_helper'

describe "User creates a new category" do
  scenario "a user creates a new category" do
    visit "/categories/new"
    fill_in "category[title]", with: "Web Development"
    click_button "Create"

    expect(page).to have_content("Web Development")
  end
  scenario "a user tries to create an existing repo" do
    Category.create(title: "Web Development")

    visit "/categories/new"
    fill_in "category[title]", with: "Web Development"
    click_button "Create"

    expect(page).to have_content "Create a New Category"
    expect(page).to have_content "Title"
    expect(current_path).to eq '/categories'
  end
end