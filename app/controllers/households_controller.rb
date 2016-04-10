class HouseholdsController < ApplicationController

  def show
    @household = Household.find_by_id(params[:id])
  end

end
