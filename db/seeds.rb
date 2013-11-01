# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
Role.find_or_create_by_name({ :name => :admin }, :without_protection => true)
Role.find_or_create_by_name({ :name => :user }, :without_protection => true)
Role.find_or_create_by_name({ :name => :provider }, :without_protection => true)

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :first_name => "Admin", :last_name =>"P", :email => "admin@concert.com", :password => "changeme", :password_confirmation => "changeme"

puts 'user: ' << user.name
user.add_role :admin