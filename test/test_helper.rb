ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def create_user
    TestUserBuilder.new
  end

  def create_cleaning
    TestCleaningBuilder.new
  end

  def login
    post sessions_path, params: { email: 'foo@example.com', password: 'secret' }
  end

  def signup
    post users_path, params: { user: { name: 'John Doe', email: 'foo@example.com', password: 'secret' } }
  end

  def signup_and_login
    signup
    login
  end

  def logout
    get log_out_path
  end

  def current_user
    User.find(session[:user_id])
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

class TestChoreBuilder
  def initialize
    @name = 'foo'

    a_household = Household.new
    a_household.save
    @household_id = a_household.id
  end

  def without_name
    @name = nil
    self
  end

  def without_household
    @household_id = nil
    self
  end

  def with_household(id)
    @household_id = id
    self
  end

  def build
    chore_attributes = {}
    chore_attributes[:name] = @name if @name
    chore_attributes[:household_id] = @household_id if @household_id
    Chore.new( chore_attributes )
  end
end

class TestCleaningBuilder

  require 'test_helper'

  def initialize
    @date = DateTime.now

    a_chore = TestChoreBuilder.new.build
    a_chore.save
    @chore_id = a_chore.id

    a_user = TestUserBuilder.new.build
    a_user.save
    @user_id = a_user.id
  end

  def without_date
    @date = nil
    self
  end

  def without_chore
    @chore_id = nil
    self
  end

  def without_user
    @user_id = nil
    self
  end

  def with_chore(id)
    @chore_id = id
    self
  end

  def with_user(id)
    @user_id = id
    self
  end

  def build
    user_attributes = {}
    user_attributes[:date] = @date if @date
    user_attributes[:chore_id] = @chore_id if @chore_id
    user_attributes[:user_id] = @user_id if @user_id
    Cleaning.new( user_attributes )
  end
end