require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    job = create(:job)

    visit company_job_path(job.company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("50")
  end
end
