require 'test_helper'

class CleaningTest < ActiveSupport::TestCase

  def setup

  end

  test 'saving cleaning with date chore and user should succeed' do
    a_cleaning = create_cleaning.build

    assert a_cleaning.save, 'Saving cleaning for a valid chore and user with valid date failed!'
  end

  test 'should not save cleaning without arguments' do
    a_cleaning = Cleaning.new()
    assert_not a_cleaning.save, 'Should not have saved cleaning without any given arguments!'
  end

  test 'should not save cleaning without a date' do
    a_cleaning = create_cleaning.without_date.build
    assert_not a_cleaning.save, 'Should not have saved cleaning without a date given!'
  end

  test 'should not save cleaning without a chore' do
    a_cleaning = create_cleaning.without_chore.build
    assert_not a_cleaning.save, 'Should not have saved cleaning without a chore given!'
  end

  test 'should not save cleaning without a user' do
    a_cleaning = create_cleaning.without_user.build
    assert_not a_cleaning.save, 'Should not have saved cleaning without a user given!'
  end

  test 'should not save cleaning with nonexistent chore id' do
    assert_not Chore.find_by_id(777), 'Chore with id 777 should not exist!'
    a_cleaning = create_cleaning.with_chore(777).build
    assert_not a_cleaning.save, 'Should not have saved cleaning with nonexistent chore id!'
  end

  test 'should not save cleaning with nonexistent user id' do
    assert_not User.find_by_id(777), 'User with id 777 should not exist!'
    a_cleaning = create_cleaning.with_user(777).build
    assert_not a_cleaning.save, 'Should not have saved cleaning with nonexistent user id!'
  end

  private

  def create_cleaning
    TestCleaningBuilder.new
  end

end
