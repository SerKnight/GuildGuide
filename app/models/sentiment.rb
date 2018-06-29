class Sentiment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :journey
end
