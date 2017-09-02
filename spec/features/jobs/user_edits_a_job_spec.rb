require 'rails_helper'

describe "User edits a specific job" do
  scenario "a user edits a specific job" do
    job = create(:job)

    visit company_job_path(job.company, job)
    click_on "Edit"
    fill_in "job[title]", with: "QA"
    fill_in "job[description]", with: "Much fun!"
    fill_in "job[level_of_interest]", with: 50
    fill_in "job[city]", with: "Boulder"
    select "Web Development", from: "job_category_id"
    click_button "Update Job"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("QA")
    expect(page).to have_content("50")
  end
end