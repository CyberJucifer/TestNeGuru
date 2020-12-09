class User < ApplicationRecord
  def tests_by_level(test_level)
    Test.joins('INNER JOIN user_tests ON user_tests.test_id = tests.id').where(tests: { level: test_level }, user_tests: { user_id: id })
  end
end
