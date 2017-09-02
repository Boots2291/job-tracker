require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    job = create(:job)

    visit company_path(job["company_id"])

    expect(current_path).to eq("/companies/#{job["company_id"]}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
end
