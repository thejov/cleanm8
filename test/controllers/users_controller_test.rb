require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      create_user
    end
  end

  test 'should create household on sign up' do
    assert_difference('Household.count') do
      create_user
    end
  end

  test 'should add household to user on sign up' do
    create_user
    assert User.last.household_id, 'No household was added to user on sign up.'
  end

  test 'should not accept undefined parameters' do
    assert_no_difference('User.count') do
      post :create, params: { user: { foo: 'bar' } }
    end
  end

  private

  def create_user
    post :create, params: { user: { name: 'John Doe', email: 'foo@example.com',
                          password: 'secret', password_confirmation: 'secret' } }
  end


end
