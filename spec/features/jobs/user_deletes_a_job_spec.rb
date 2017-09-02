require 'rails_helper'

describe "User deletes a specific job" do
  scenario "a user deletes a specific job" do
    job = create(:job)
    job2 = create(:job)

    visit company_jobs_path(job.company)
    click_on "Developer1"
    click_on "Delete"

    expect(page).to have_content("ESPN")
    expect(page).to_not have_content("Developer1")
    expect(page).to have_content("Developer2")
  end
end