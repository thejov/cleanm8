require 'test_helper'

class ChoreTest < ActiveSupport::TestCase

  test 'saving chore with name and household should succeed' do
    household = Household.new
    household.save
    a_chore = create_chore.build
    assert a_chore.save, 'Saving chore with valid name and household failed!'
  end

  test 'should not save chore without arguments' do
    a_chore = Chore.new()
    assert_not a_chore.save, 'Should not have saved chore without arguments!'
  end

  test 'should not save chore without name' do
    a_chore = create_chore.without_name.build
    assert_not a_chore.save, 'Should not have saved chore without a name!'
  end

  test 'should not save chore without household' do
    a_chore = create_chore.without_household.build
    assert_not a_chore.save, 'Should not have saved chore without a household!'
  end

  private

  def create_chore
    TestChoreBuilder.new
  end

end
