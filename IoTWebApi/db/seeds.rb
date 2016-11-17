# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.delete_all
Course.delete_all

@s = School.create(name:'IPT', country:'teste', distric:'teste',  city:'teste', county:'teste', postCode:'teste', addressDetails:'teste')

@s.courses.create(name:'teste1')

User.create(name: 'teste', email: 'teste')



puts "Success: seed data loaded"