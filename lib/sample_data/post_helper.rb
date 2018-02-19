module SampleData
  module PostHelper
    def self.create_post(user)
      Post.create(
        user: user,
        title: Faker::Book.title,
        votes: rand(10...42)
      )
    end

    def self.create_posts(users, count = 5)
      users.each do |user|
        count.times.each do 
          create_post(user)
        end
      end
      puts "posts created!"
    end
  end
end