class BloodOath
	attr_reader :initiation_date
	attr_accessor :cult, :follower
	@@all = []

	def initialize(cult, follower)
		@cult = cult
		@follower = follower
		d = DateTime.now
		@initiation_date = d.strftime("%Y/%m/%d")
		@@all << self
	end

	def self.all
		@@all
	end
end