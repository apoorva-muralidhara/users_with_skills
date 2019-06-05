require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_skills).dependent(:destroy) }
    it { is_expected.to have_many(:skills).through(:user_skills) }
  end

  describe '.import' do
    let(:path) { file_fixture('three_users.csv') }

    before { User.import(path) }

    it 'creates users' do
      expect(User.count).to eq(3)
      expect(User.find_by!(email: 'scott.baker@ux.io'))
        .to have_attributes(name: 'Scott Baker',
                            global_admin: false,
                            timezone: 'PST',
                            receive_marketing: false,
                            external_identifier: 's7754756893610')
    end

    it 'creates skills' do
      expect(Skill.count).to eq(3)
      expect(Skill.pluck(:name))
        .to match_array(%w(Dancing Prancing Chancing))
    end
  end
end
