require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_skills).dependent(:destroy) }
    it { is_expected.to have_many(:skills).through(:user_skills) }
  end
end
