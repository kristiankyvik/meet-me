class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :visits
  # validates :user_name, presence: true, format: {with: /\A+[a-zA-Z0-9]+\z/}, uniqueness: true
  # validates :name, presence: true
end
