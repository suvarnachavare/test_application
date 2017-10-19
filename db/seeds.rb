# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q", "R", "S", "T"]

# Create User
names.each_with_index do |a, i|
  User.create(name: "User" << names[i])
end

# Create Tenants
names.each_with_index do |a, i|
  Tenant.create(name: "Tenants"<< names[i])
end


# Questions and Answers
names.each_with_index do |a, i|
  question = Question.create(title: "Question" << names[i], private: true, user_id: i+1)
  (1 + rand(3)).times do
    question.answers.create(answers: "Answer" << names[i], user_id: i+1)
  end
end