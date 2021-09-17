ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user)
    # here we're just signing the user in by posting to the login path which puts the user id to the session
    # and the password provided here is the same as the password provided in the categories controller test setup method
    post login_path, params: { session: { email: user.email, password: "password" } }
  end
end
