task :greet do	
	puts "hello world!"
end

task :ask => :greet do 
	puts 'how are you?'
end

namespace :pick do

	task :winner do
		require 'faker'
		usrnm = Faker::Name.name
		puts "Winner: #{usrnm}"
	end

	task :prize do
		require 'faker'
		prize = Faker::Commerce.product_name
		puts "Prize: #{prize}"
	end

	task :both => [:prize, :winner]

end