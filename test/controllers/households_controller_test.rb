require 'test_helper'

class HouseholdsControllerTest < ActionDispatch::IntegrationTest

  setup do
    signup_and_login
  end

  test 'should show household' do
    get household_path(households(:one))
    assert_response :success
  end

end
