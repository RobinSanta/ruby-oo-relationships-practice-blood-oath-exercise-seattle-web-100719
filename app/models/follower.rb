class Follower
	attr_reader :name, :life_motto
	attr_accessor :age, :cults
	@@all = []

	def initialize(name, age, life_motto)
		 @name = name
		 @age = age
		 @life_motto = life_motto
		 @cults = []
		 @@all << self
	end

	def join_cult(cult)
		BloodOath.new(cult, self)
		@cults << cult
	end

	def my_cults_slogans
		BloodOath.all.map {|blood_oath| blood_oath.cult.slogan}
	end

	def self.all
		@@all
	end

	def self.of_a_certian_age(num)
		@@all.select {|follower| follower.age >= num}
	end

	def self.most_active
		arr = BloodOath.all.map {|blood_oath| blood_oath.follower}
		freq = arr.inject(Hash.new(0)) { |key, value| key[value] += 1; key }
		arr.max_by {|value| freq[value]}
	end

	def self.top_ten
		arr = BloodOath.all.map {|blood_oath| blood_oath.follower.name}
		arr.inject(Hash.new(0)) { |key, value| key[value] += 1; key }
	end

end