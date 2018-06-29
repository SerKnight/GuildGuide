class User < ApplicationRecord
  rolify
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id
  
  has_many :user_journeys
  has_many :journeys, through: :user_journeys

  after_create :determine_role

  def determine_role
    if email && email.include?('@guildeducation.com')
      self.add_role :admin
    else
      self.add_role :student
    end
  end

end