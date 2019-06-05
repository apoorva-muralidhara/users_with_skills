require 'rails_helper'

RSpec.describe "CSV Uploads" do
  let(:file) { Rack::Test::UploadedFile.new(file_fixture('users.csv'), 'text/csv') }
  let(:params) { { file: file } }

  describe "POST /csv_uploads" do
    before do
      allow(User).to receive(:import)
      post csv_uploads_path, params: params
    end

    it 'succeeds' do
      expect(response).to have_http_status(:created)
    end

    it 'calls User.import with the uploaded file' do
      expect(User).to have_received(:import).with(kind_of(String))
    end
  end
end
