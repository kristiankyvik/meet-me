class User < ActiveRecord::Base
  has_many :visits
  validates :username, presence: true, format: {with: /\A+[a-zA-Z0-9]+\z/}
  validates :name, presence: true



end
