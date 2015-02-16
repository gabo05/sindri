class Pagination
	attr_accessor :size
	attr_accessor :page
	attr_reader :no_pages
	attr_reader :collection
	def initialize(page, size, collection)

		@size = size.to_i == 0 ? 5 : size.to_i
        
        @page = page.to_i <= 0 ? page.to_i : page.to_i() -1

		@collection = collection

		no_records = collection.count

		@no_pages = (no_records % @size) > 0 ? no_records / @size + 1 : no_records / @size
	end
	def get_records
		self.collection.limit(self.size).offset(self.page*self.size)
	end
end