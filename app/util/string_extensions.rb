class String
	def to_date
		date_numbers = self.split '/'
		return DateTime.new(date_numbers[2].to_i, date_numbers[1].to_i, date_numbers[0].to_i)
	end
end