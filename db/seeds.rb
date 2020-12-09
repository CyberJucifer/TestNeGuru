# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { nickname: '1User', password: '123' },
                       { nickname: '2User', password: 'qwerty' }
                     ])

categories = Category.create!([
                                { title: 'HTML' },
                                { title: 'Data Science' }
                              ])

tests = Test.create!([
                       { title: 'Test for Beginner', level: 1, category_id: categories.last.id, user_id: users.first.id },
                       { title: 'Test for junior', level: 1, category_id: categories.first.id, user_id: users.first.id },
                       { title: 'Test for middle', level: 2, category_id: categories.first.id, user_id: users.first.id },
                       { title: 'Test for senior', level: 3, category_id: categories.first.id, user_id: users.first.id },
                       { title: 'Test for mutants', level: 4, category_id: categories.last.id, user_id: users.last.id }
                     ])

questions = Question.create!([
                               { title: 'True == True', test_id: tests.first.id },
                               { title: 'False == True', test_id: tests.last.id }
                             ])

Answer.create!([
                 { title: 'True', correct: true, question_id: questions.first.id },
                 { title: 'False', question_id: questions.first.id },
                 { title: 'False', correct: true, question_id: questions.last.id },
                 { title: 'True', question_id: questions.last.id }
               ])

UserTest.create!([
                   { user_id: users.first.id, test_id: tests.first.id},
                   { user_id: users.first.id, test_id: tests[1].id},
                   { user_id: users.first.id, test_id: tests[2].id},
                   { user_id: users.last.id, test_id: tests.last.id}
                 ])