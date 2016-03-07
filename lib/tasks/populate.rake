namespace :csv do

  desc "Import CSV Data"
  task :import_data => :environment do

    require 'csv'

    csv_file_path = 'lib/data_sample.csv'

	  Datum.all.delete_all
    CSV.foreach(csv_file_path, headers: true) do |row|
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
		puts "Success!"
    end
  end

    desc "Import CSV Stats"
    task :import_states => :environment do

      require 'csv'

      csv_file_path = 'lib/states_counties.csv'

  	  StateCount.all.delete_all
      CSV.foreach(csv_file_path, headers: true) do |row|
  		record = StateCount.create!({
  			state: row[1].encode!("utf-8", "utf-8", :invalid => :replace),
  			county: row[2].encode!("utf-8", "utf-8", :invalid => :replace),
  		})
 		
    	puts "s " + row[0].to_s
      end
    end
end