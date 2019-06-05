class Skill < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
