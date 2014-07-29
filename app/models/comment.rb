class Comment < ActiveRecord::Base
  belongs_to :location
  validates_associated :location
end
