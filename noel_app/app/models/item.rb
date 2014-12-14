class Item < ActiveRecord::Base
  has_many :links
  has_many :lists, through: :links
end
