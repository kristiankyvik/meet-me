

class Location < ActiveRecord::Base
	has_many :visits
	validates :name, presence: true
	validates :city, presence: true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  



	def self.finder(id1)
		where(id: id1).first
	end

	def self.last_created(number)
		order("created_at ASC").limit(number)
	end

	def self.is_spanish
		where(country: "Spain")
	end

	def total_visits_in_month_of_year(month, year)
		visit_counter=0
		from=DateTime.new(year,month,1).beginning_of_day
		to=DateTime.new(year,month,30).end_of_day
		visits.where(:from_date => from..to).count
	end
end