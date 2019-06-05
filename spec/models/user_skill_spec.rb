require 'rails_helper'

RSpec.describe UserSkill, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:skill) }
end
