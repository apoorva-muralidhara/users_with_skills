require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let(:first_user_attributes) do
      { email: 'scott.baker@ux.io',
        name: 'Scott Baker',
        timezone: 'PST',
        external_identifier: 's7754756893610' }
    end

    let(:second_user_attributes) do
      { email: 'cathy.carey@ux.io',
        name: 'Cathy Carey',
        timezone: 'PST',
        external_identifier: 'c3033236182949' }
    end

    before do
      create(:user, first_user_attributes)
      create(:user, second_user_attributes)

      get api_users_path
    end

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end

    it 'returns JSON' do
      expect(response.content_type).to eq('application/json')
    end

    it 'returns the right response' do
      expect(json)
        .to contain_exactly(include(first_user_attributes.stringify_keys),
                            include(second_user_attributes.stringify_keys))
    end

    private

    def json
      JSON.parse(response.body)
    end
  end
end
