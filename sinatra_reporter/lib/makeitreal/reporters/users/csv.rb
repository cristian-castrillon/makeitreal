require "csv"

module Makeitreal
	module Reporters
		module Users
			class Csv
				def self.report users
					puts "Creating a report"

					file = CSV.open("users_report.csv", "w+")
					file << ["email", "full_name", "role"]
					users.each { |user| file << [user.email, user.full_name, user.role] }
					file.close

					puts "Done creating a report"

					file
				end

				def self.generate users
					puts "Generating a report"

					file = CSV.generate do |csv|
						csv << ["email", "full_name", "role"]
						users.each { |user| csv << [user.email, user.full_name, user.role] }						
					end
					

					puts "Done generating a report"

					file
				end
			end
		end
	end
end