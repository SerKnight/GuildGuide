class Journey < ApplicationRecord
  has_many :message_templates
  
  has_many :user_journeys
  has_many :users, through: :user_journeys

end
