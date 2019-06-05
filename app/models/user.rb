require 'csv'

class User < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  def self.import(path)
    CSV.foreach(path, headers: true) do |row|
      csv_values = row.to_hash
      User.create!(email: csv_values['email'],
                   name: csv_values['name'],
                   global_admin: (csv_values[:'global_admin'] == 't'),
                   timezone: csv_values['_timezone'],
                   receive_marketing: (csv_values['receive_marketing'] == 't'),
                   external_identifier: csv_values['external_id'])
     end
  end
end
