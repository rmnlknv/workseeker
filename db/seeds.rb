# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_list = ["JavaScript", "Java", ".NET", "iOS", "Android", "Team Lead", "Design", "PHP", "Python", "Ruby", "C++", "Unity", "QA", "SQL", "Sysadmin", "Embedded", "Project Manager", "Product Manager", "Business Analyst", "HR", "Marketing", "Other"]

category_list.each do |name|
  Category.create( name: name )
end