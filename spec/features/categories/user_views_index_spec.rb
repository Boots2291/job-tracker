require 'rails_helper'

describe "User views the category index" do
  scenario "user sees a list of all categories" do
    Category.create(title: "Web Development")
    Category.create(title: "Education")
    Category.create(title: "Finance")

    visit "/categories"

    expect(page).to have_content("Web Development")
    expect(page).to have_content("Education")
    expect(page).to have_content("Finance")
  end
  scenario "user can delete categories from index" do
    Category.create(title: "Web Development")
    Category.create(title: "Education")
    Category.create(title: "Finance")

    visit "/categories"
    first('.category').click_on("Delete")

    expect(page).to have_content("Education")
    expect(page).to have_content("Finance")
  end
  scenario "user can edit categories from index" do
    category = Category.create(title: "Education")
    category2 = Category.create(title: "Web Development")

    visit "/categories"
    first('.category').click_on("Edit")

    expect(page).to have_content("Edit #{category[:title]}")
    expect(page).to have_content("Title")

    fill_in "Title", with: "Finance"
    click_on "Update Category"

    expect(page).to have_content("Web Development")
    expect(page).to have_content("Finance")
    expect(page).to_not have_content("Education")
  end
end