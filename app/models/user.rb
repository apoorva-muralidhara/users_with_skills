require 'csv'

class User < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  def self.import(path)
    # CSV.foreach(path, headers: true) do |row|
    #   puts "It's #{row.to_hash.inspect}!"
    # end
  end
end
