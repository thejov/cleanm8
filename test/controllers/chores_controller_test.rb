require 'test_helper'

class ChoresControllerTest < ActionDispatch::IntegrationTest

  setup do
    signup_and_login
    @chore = chores(:one)
  end

  test 'should open index page' do
    get chores_url
    assert_response :success
  end

  test 'should open new chore page' do
    get new_chore_url
    assert_response :success
  end

  test 'should create chore' do
    assert_difference('Chore.count') do
      create_chore
    end
  end

  test 'should redirect to created chore' do
    create_chore
    assert_redirected_to chore_path(Chore.last)
  end

  test 'should show notice about created chore' do
    create_chore
    assert_equal 'Chore was successfully created.', flash.notice
  end

  test 'should add chore to current household' do
    create_chore
    assert_equal Chore.last.household_id, current_user.household_id
  end

  test 'should show chore' do
    get chore_path(@chore)
    assert_response :success
  end

  test 'should open edit chore page' do
    get edit_chore_path(@chore)
    assert_response :success
  end

  test 'should update chore name' do
    patch chore_path(@chore), params: { chore: { name: 'new name', household_id: current_user.household_id } }
    assert_equal 'new name', Chore.find_by_id(@chore.id).name
  end

  test 'should show notice about updated chore' do
    patch chore_path(@chore), params: { chore: { name: 'new name', household_id: current_user.household_id } }
    assert_equal 'Chore was successfully updated.', flash.notice
  end

  test 'should destroy chore' do
    assert_difference('Chore.count', -1) do
      delete chore_path(@chore)
    end
  end

  test 'should redirect to chore list after destroying chore' do
    delete chore_path(@chore)
    assert_redirected_to chores_path
  end

  test 'should show notice about destroyed chore' do
    delete chore_path(@chore)
    assert_equal 'Chore was successfully destroyed.', flash.notice
  end

  private

  def create_chore
    post chores_url, params: { chore: { name: 'foo' } }
  end

end
