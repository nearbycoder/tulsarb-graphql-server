require 'sample_data/sample_data'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:reset, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Drop, create, migrate'
  task reset: [:drop, :create, :migrate] do
    puts 'Database reset'
  end

  desc 'Populate EventType and Location'
  task populate_sample_data: :environment do
    users = SampleData::UserHelper.create_users
    SampleData::PostHelper.create_posts(users)
  end
end