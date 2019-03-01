# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.new(email: 'priya@blogapp.com',
          name: 'Lakshmipriya',
          password: 'password',
          password_confirmation: 'password',
          created_at: Time.now).save(validate: false)
User.new(email: 'steve@blogapp.com',
          name: 'Steve Robinson',
          password: 'password',
          password_confirmation: 'password',
          created_at: Time.now).save(validate: false)
User.new(email: 'prabakar@blogapp.com',
          name: 'Prabakar',
          password: 'password',
          password_confirmation: 'password',
          created_at: Time.now).save(validate: false)                   