class User < ActiveRecord::Base
  has_many :visits
  validates :username, presence: true
  validates :name, presence: true
  

end
