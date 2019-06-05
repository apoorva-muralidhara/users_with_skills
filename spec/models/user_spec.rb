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

    it 'matches users to skills' do
      expect(User.find_by!(email: 'scott.baker@ux.io').skills.pluck(:name))
        .to match_array(%w(Dancing Prancing))
      expect(User.find_by!(email: 'cathy.carey@ux.io').skills.pluck(:name))
        .to contain_exactly('Chancing')
      expect(User.find_by!(email: 'lynn.yates@ux.io').skills.pluck(:name))
        .to contain_exactly('Prancing')

      expect(Skill.find_by!(name: 'Dancing').users.pluck(:email))
        .to contain_exactly('scott.baker@ux.io')
      expect(Skill.find_by!(name: 'Chancing').users.pluck(:email))
        .to contain_exactly('cathy.carey@ux.io')
      expect(Skill.find_by!(name: 'Prancing').users.pluck(:email))
        .to contain_exactly('scott.baker@ux.io', 'lynn.yates@ux.io')
    end
  end
end
