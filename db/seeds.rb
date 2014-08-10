# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


question = Question.create(title: "1st question", body: "how do i grow hair")


10.times do |i|
	Question.create(title: "This is a question", body: "Some question")
end
10.times do |i|
	Answer.create(body: "You know you really shouldn't be doing that", question_id: i)
end