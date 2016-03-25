require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should open login page' do
    get log_in_path
    assert_response :success
  end

  test 'should show logged in notice on successful login' do
    signup_and_login
    assert_equal 'Logged in!', flash.notice
  end

  test 'should show alert on unsuccessful login' do
    try_login_with_unregistered_email
    assert_equal 'Invalid email or password', flash.alert
  end

  test 'should redirect to root url on successful login' do
    signup_and_login
    assert_redirected_to root_url
  end

  test 'should show logout notice on logout' do
    signup_and_login
    logout
    assert_equal 'Logged out!', flash.notice
  end

  test 'should create session on login' do
    signup_and_login
    assert_not_nil session[:user_id]
  end

  test 'should not create session on unsuccessful login' do
    try_login_with_unregistered_email
    assert_not session[:user_id]
  end

  test 'should destroy session after logout' do
    signup_and_login
    logout
    assert_not session[:user_id]
  end

  private

  def try_login_with_unregistered_email
    post sessions_path, params: { email: 'unregistered@example.com', password: 'foo' }
  end

end
