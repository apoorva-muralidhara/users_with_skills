require 'rails_helper'

RSpec.feature "CSV Uploads", type: :feature do
  scenario "Uploading CSV successfully" do
    visit root_path

    expect(page).to have_text('Upload your CSV below')
  end
end
