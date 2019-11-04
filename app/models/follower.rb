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

	def self.all
		@@all
	end

	def self.of_a_certian_age(num)
		@@all.select {|follower| follower.age >= num}
	end

end