class Visit < ActiveRecord::Base
	belongs_to :location

  validates :to_date, presence: true
  validates :from_date, presence: true
  validates :user_name, presence: true
  validates_presence_of :location
  validate :from_date_is_before_than_to_date
  validate :from_date_must_be_in_future
  
  def from_date_is_before_than_to_date
    if self.from_date > self.to_date
      errors.add(:from_date, "can't do the dates")
    end
  end

  def from_date_must_be_in_future 
    if from_date <= DateTime.now
      errors.add(:from_date, "can't be in the past")
    end
  end
end
