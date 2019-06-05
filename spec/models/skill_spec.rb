require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:name) { 'unicycling' }

  subject(:skill) { create(:skill, name: name) }

  describe 'associations' do
    it { is_expected.to have_many(:user_skills).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
