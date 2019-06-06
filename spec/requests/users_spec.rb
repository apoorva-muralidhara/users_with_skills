require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before { get api_users_path }

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end

    it 'returns JSON' do
      expect(response.content_type).to eq('application/json')
    end
  end
end
