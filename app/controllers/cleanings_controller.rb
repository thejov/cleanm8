class CleaningsController < ApplicationController

  def create
    chore = Chore.find( params[:chore] )
    @cleaning = Cleaning.new( { :date => DateTime.now, :chore_id => chore.id } )

    logger.debug "Cleaning created: #{@cleaning.inspect}"

    respond_to do |format|
      if @cleaning.save
        format.html { redirect_to @cleaning.chore, notice: 'Cleaning was added successfully.' }
        format.json { render :show, status: :created, location: @cleaning.chore }
      else
        format.html { render chore_path( params[:chore] ) }
        format.json { render json: @cleaning.errors, status: :unprocessable_entity }
      end
    end

  end

end
