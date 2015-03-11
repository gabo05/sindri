class String
	def to_date
		date_numbers = self.split '/'
		return DateTime.new(date_numbers[2].to_i, date_numbers[1].to_i, date_numbers[0].to_i)
	end
	def to_sqldate
		date_numbers = self.split '/'
		return [date_numbers[2], date_numbers[1], date_numbers[0]].join('')
	end
	def on_empty replace
		if self.replace(' ','') == ''
			return replace
		end
		return self
	end
end