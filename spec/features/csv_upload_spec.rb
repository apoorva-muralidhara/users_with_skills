require 'rails_helper'

RSpec.feature "CSV Uploads" do
  scenario "Uploading CSV successfully" do
    visit root_path

    expect(page).to have_text('Upload your CSV below')

    attach_file('Upload Your CSV', file_fixture('users.csv'))

    allow(User).to receive(:import)

    click_button('Upload')

    expect(page).to have_text('CSV successfully uploaded!')
  end
end
