require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  test 'saving chore with name should succeed' do
    a_chore = Chore.new(:name => 'foo')
    assert a_chore.save, 'Saving chore with valid name failed!'
  end

  test 'should not save chore without name' do
    a_chore = Chore.new()
    assert_not a_chore.save, 'Should not have saved chore without a name!'
  end

end
