require 'test_helper'

class CleaningsControllerTest < ActionDispatch::IntegrationTest

  setup do
    signup_and_login
    @chore = chores(:one)
  end

  test 'should create cleaning' do
    assert_difference('Cleaning.count') do
      create_cleaning
    end
  end

  test 'should show notice about created cleaning' do
    create_cleaning
    assert_equal 'Cleaning was added successfully.', flash.notice
  end

  test 'should not create cleaning without logged in user' do
    logout
    assert_no_difference('Cleaning.count') do
      create_cleaning
    end
  end

  test 'should raise exception when creating cleaning with non-existent chore id' do
    assert_raise ActiveRecord::RecordNotFound do
      post cleanings_url, params: { cleaning: { chore_id: 777 } }
    end
  end

  private

  def create_cleaning
    post cleanings_url, params: { cleaning: { chore_id: @chore.id } }
  end

end
