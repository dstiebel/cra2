class Datum < ActiveRecord::Base
	require 'csv'

	def self.import(file)
		Datum.all.delete_all
	    CSV.foreach(file.path, headers: true) do |row|
			row = Datum.create!({
				loan_number:row[0],
				product_description: row[1],
				type_product: row[2],
				census_tract: row[3],
				income_level: row[4],
				state: row[5],
				county: row[6],
				state_fips: row[7],
				county_fips: row[8],
				purpose: row[9],
				property_type: row[10],
				fico: row[11],
				application_date: Date.strptime(row[12], '%m/%d/%Y'),
			})
		end
	end

end
