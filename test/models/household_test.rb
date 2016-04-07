require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase

  test 'should save household' do
    a_household = Household.new
    assert a_household.save
  end

end
