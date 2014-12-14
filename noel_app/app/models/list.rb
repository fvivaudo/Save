class List < ActiveRecord::Base
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations
  has_many :links
  has_many :items, through: :links
end
