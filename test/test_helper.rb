ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_user
    TestUserBuilder.new
  end

end

class TestUserBuilder
  def initialize
    @name = 'John Doe'
    @email = 'foo@example.com'
    @password = 'secret'
  end

  def with_name(name)
    @name = name
    self
  end

  def with_email(email)
    @email = email
    self
  end

  def with_password(password)
    @password = password
    self
  end

  def without_name
    @name = nil
    self
  end

  def without_email
    @email = nil
    self
  end

  def without_password
    @password = nil
    self
  end

  def build
      user_attributes = {}
      user_attributes[:name] = @name if @name
      user_attributes[:email] = @email if @email
      user_attributes[:password] = @password if @password
      User.new( user_attributes )
  end
end