require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'saving user with name and email and password should succeed' do
    assert create_user.build.save, 'Saving user with valid name, email and password failed!'
  end

  test 'should not save user without arguments' do
    a_user = User.new()
    assert_not a_user.save, 'Should not have saved user without any given arguments!'
  end

  test 'should not save user without name' do
    a_user = create_user.without_name.build
    assert_not a_user.save, 'Should not have saved user without any given name!'
  end

  test 'should not save user without email' do
    a_user = create_user.without_email.build
    assert_not a_user.save, 'Should not have saved user without any given email!'
  end

  test 'should not save user without password' do
    a_user = create_user.without_password.build
    assert_not a_user.save, 'Should not have saved user without any given password!'
  end

  test 'should not save user with same email address' do
    a_user = create_user.with_email('juha@example.com').build
    a_user.save

    another_user = create_user.with_email('juha@example.com').build
    assert_not another_user.save, 'Should not have saved user with identical email address to existing other user!'
  end

  test 'authenticating with matching password should succeed' do
    a_user = create_user.with_email('juha@example.com').with_password('secret').build
    a_user.save

    assert_equal User.authenticate('juha@example.com', 'secret'), a_user,
                 'Authentication with matching password failed!'
  end

  test 'authenticating with incorrect password should fail' do
    a_user = create_user.with_email('juha@example.com').with_password('secret').build
    a_user.save

    assert_nil User.authenticate('juha@example.com', 'incorrect password'),
               'Authenticating with incorrect password succeeded!'
  end

  test 'authenticating unregistered email should fail' do
    assert_nil User.authenticate('unregistered@example.com', 'password'),
               'Authenticating unregistered email succeeded!'
  end

  private

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
