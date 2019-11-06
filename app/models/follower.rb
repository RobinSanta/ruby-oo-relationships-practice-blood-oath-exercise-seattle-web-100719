class Follower
	attr_reader :name, :life_motto
	attr_accessor :age
	@@all = []

	def initialize(name, age, life_motto)
		 @name = name
		 @age = age
		 @life_motto = life_motto
		 @@all << self
	end

	def cults
		BloodOath.all.select {|blood_oath| blood_oath.follower == self}.map {|blood_oath| blood_oath.cult}
	end

	def join_cult(cult)
		if cult.minimum_age && self.age < cult.minimum_age
			return "You are too young to join this cult."
		else
			BloodOath.new(cult, self)
		end
	end

	def my_cults_slogans
		BloodOath.all.select {|blood_oath| blood_oath.follower == self}.map {|blood_oath| blood_oath.cult.slogan}
	end

	def fellow_cult_members
	end

	def self.all
		@@all
	end

	def self.of_a_certian_age(num)
		@@all.select {|follower| follower.age >= num}
	end

	def self.most_active
		arr = BloodOath.all.map {|blood_oath| blood_oath.follower}
		freq = arr.inject(Hash.new(0)) {|key, value| key[value] += 1; key}
		arr.max_by {|value| freq[value]}
	end

	def self.top_ten
		arr = BloodOath.all.map {|blood_oath| blood_oath.follower.name}
		ranking = arr.inject(Hash.new(0)) {|key, value| key[value] += 1; key}

	end

end