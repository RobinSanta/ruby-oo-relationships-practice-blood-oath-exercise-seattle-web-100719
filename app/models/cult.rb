class Cult
	attr_reader :name, :location, :founding_year, :slogan
	attr_accessor :minimum_age
	@@all = []

	def initialize(name, location, founding_year, slogan, minimum_age = nil)
		 @name = name
		 @location = location
		 @founding_year = founding_year
		 @slogan = slogan
		 @minimum_age = minimum_age
		 @@all << self
	end

	def recruit_follower(follower)
		if self.minimum_age && follower.age < self.minimum_age
			return "This person is too young to join our cult."
		else
			BloodOath.new(self, follower)
		end
	end

	def cult_population
		BloodOath.all.select {|blood_oath| blood_oath.cult == self}.length
	end

	def average_age
		sum = BloodOath.all.select {|blood_oath| blood_oath.cult == self}.map {|blood_oath| blood_oath.follower.age}.sum.to_f
		sum / BloodOath.all.select {|blood_oath| blood_oath.cult == self}.length
	end

	def my_followers_mottos
		BloodOath.all.select {|blood_oath| blood_oath.cult == self}.map {|blood_oath| blood_oath.follower.life_motto}
	end

	def self.all
		@@all
	end

	def self.find_by_name(cult_name)
		@@all.find {|cult| cult.name == cult_name}
	end

	def self.find_by_location(cult_location)
		@@all.select {|cult| cult.location == cult_location}
	end

	def self.find_by_founding_year(year)
		@@all.select {|cult| cult.founding_year == year}
	end

	def self.least_popular
		min = 100000000000
		min_pop = []
		@@all.each do |cult|
			if cult.cult_population <= min
				min_pop << cult
				min = cult.cult_population
			end
		end
		min_pop
	end

	def self.most_common_location
		arr = @@all.map {|cult| cult.location}
		freq = arr.inject(Hash.new(0)) { |key, value| key[value] += 1; key }
		arr.max_by {|value| freq[value]}
	end

end