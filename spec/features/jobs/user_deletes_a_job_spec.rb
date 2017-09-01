require 'rails_helper'

describe "User deletes a specific job" do
  scenario "a user deletes a specific job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "QA", level_of_interest: 50, city: "Boulder")

    visit company_jobs_path(company)
    click_on "Developer"
    click_on "Delete"

    expect(page).to have_content("ESPN")
    expect(page).to_not have_content("Developer")
    expect(page).to have_content("QA")
  end
end