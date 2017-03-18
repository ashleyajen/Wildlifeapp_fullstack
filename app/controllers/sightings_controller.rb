class SightingsController < ApplicationController
  before_action :set_sighting, only: [:show, :edit, :update, :destroy]

  # GET /sightings
  # GET /sightings.json
  # TODO: fix time edge cases


  def index
    if params[:start_date].present? && params[:end_date].present? && !params[:region].blank?
      @sightings = Sighting.where(date: params[:start_date]..params[:end_date], region: params[:region])
      # render('sightings/index.html.erb')
    else
      @sightings = Sighting.all
    end
  end


  def get_events
      @sightings = Sighting.all
      events = []
      @sightings.each do |sighting|
        events << { id: sighting.id, title: sighting.animal.common_name, start: sighting.date, url: Rails.application.routes.url_helpers.sighting_path(sighting.id), color: sighting.color}
      end
      render :json => events.to_json
    end
# loop through all the sightings. if sighting.region = params[:region]

  # GET /sightings/1
  # GET /sightings/1.json
  def show
  end

  # GET /sightings/new
  def new
      @animal = Animal.find(params[:animal_id])
      @sighting = Sighting.new
      @sighting.animal = @animal
  end

  # GET /sightings/1/edit
  def edit
  end

  # POST /sightings
  # POST /sightings.json
  def create
    @sighting = Sighting.new(sighting_params)

    respond_to do |format|
      if @sighting.save
        format.html { redirect_to @sighting, notice: 'Sighting was successfully created.' }
        format.json { render :show, status: :created, location: @sighting }
      else
        format.html { render :new }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sightings/1
  # PATCH/PUT /sightings/1.json
  def update
    respond_to do |format|
      if @sighting.update(sighting_params)
        format.html { redirect_to @sighting, notice: 'Sighting was successfully updated.' }
        format.json { render :show, status: :ok, location: @sighting }
      else
        format.html { render :edit }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sightings/1
  # DELETE /sightings/1.json
  def destroy
    @sighting.destroy
    respond_to do |format|
      format.html { redirect_to sightings_url, notice: 'Sighting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sighting
      @sighting = Sighting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sighting_params
      params.require(:sighting).permit(:date, :reccurence, :latitude, :longitude, :region, :animal_id, :color)
    end
end
