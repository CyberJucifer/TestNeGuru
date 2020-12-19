# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { nickname: '1User', password: '123', email: '1usermail@mail.ru' },
                       { nickname: '2User', password: 'qwerty', email: 'qwer@mail.ru' }
                     ])

categories = Category.create!([
                                { title: 'HTML' },
                                { title: 'Data Science' }
                              ])


tests = Test.create!([
                       { title: 'Test for Beginner', level: 1, category: categories.last, creator: users.first },
                       { title: 'Test for junior', level: 1, category: categories.first, creator: users.first },
                       { title: 'Test for middle', level: 2, category: categories.first, creator: users.first },
                       { title: 'Test for senior', level: 3, category: categories.first, creator: users.last },
                       { title: 'Test for mutants', level: 4, category: categories.last, creator: users.last }
                     ])

questions = Question.create!([
                               { title: 'True == True', test: tests.first },
                               { title: 'False == True', test: tests.last }
                             ])

Answer.create!([
                 { title: 'True', correct: true, question: questions.first },
                 { title: 'False', question: questions.first },
                 { title: 'False', correct: true, question: questions.last },
                 { title: 'True', question: questions.last }
               ])

UserTest.create!([
                   { user: users.first, test: tests.first },
                   { user: users.last, test: tests[1] },
                   { user: users.first, test: tests[2] },
                   { user: users.last, test: tests.last }
                 ])
