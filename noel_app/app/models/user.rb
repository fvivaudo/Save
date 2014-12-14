class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :participations
  has_many :lists, through: :participations

  def self.search(query)
    where("email like ?", "%#{query}%")
  end
end
