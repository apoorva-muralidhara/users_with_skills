require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let(:scott_attributes) do
      { email: 'scott.baker@ux.io',
        name: 'Scott Baker',
        global_admin: false,
        timezone: 'PST',
        receive_marketing: false,
        external_identifier: 's7754756893610' }
    end

    let(:cathy_attributes) do
      { email: 'cathy.carey@ux.io',
        name: 'Cathy Carey',
        global_admin: false,
        timezone: 'PST',
        receive_marketing: false,
        external_identifier: 'c3033236182949' }
    end

    let(:dancing_attributes) { { name: 'Dancing' } }
    let(:prancing_attributes) { { name: 'Prancing' } }
    let(:chancing_attributes) { { name: 'Chancing' } }

    let!(:scott) { create(:user, scott_attributes) }
    let!(:cathy) { create(:user, cathy_attributes) }

    let!(:dancing) { create(:skill, dancing_attributes) }
    let!(:prancing) { create(:skill, prancing_attributes) }
    let!(:chancing) { create(:skill, chancing_attributes) }

    let(:scott_skill_attributes) do
      { skills: [ { name: 'Dancing' }, { name: 'Prancing' } ] }
    end

    let(:cathy_skill_attributes) do
      { skills: [ { name: 'Chancing' } ] }
    end

    let(:scott_full_attributes) do
      scott_attributes.merge(scott_skill_attributes)
    end

    let(:cathy_full_attributes) do
      cathy_attributes.merge(cathy_skill_attributes)
    end

    before do
      scott.skills << dancing
      scott.skills << prancing

      cathy.skills << chancing
      
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
        .to contain_exactly(scott_full_attributes.deep_stringify_keys,
                            cathy_full_attributes.deep_stringify_keys)
    end

    private

    def json
      JSON.parse(response.body)
    end
  end
end
