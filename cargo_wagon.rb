class CargoWagon < Wagon

	def initialize(num, place)
		@type = :cargo
		@busy_place = 0
		super
	end

	def take_place(volume)
		@busy_place += volume
	end
end

