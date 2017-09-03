require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    job1 = create(:job)
    job2 = create(:job)

    visit company_path(job1.company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer7")
    expect(page).to have_content("Developer8")
  end
end
