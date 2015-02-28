module ReportHelper

	def get_result query
		results = ActiveRecord::Base.connection.select(sql) 
		return { :columns => result.columns, :data => result.rows }
	end
end
