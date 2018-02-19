module SampleData
  module UserHelper
    def self.create_user
      User.create(
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )
    end

    def self.create_users(count = 5)
      users = []

      count.times.each do
        users << create_user
      end
      puts "users created!"
      users
    end
  end
end