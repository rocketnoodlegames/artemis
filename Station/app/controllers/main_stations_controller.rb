class MainStationsController < ApplicationController
  before_action :set_main_station, only: [:show, :edit, :update, :destroy]

  # GET /main_stations
  # GET /main_stations.json
  def index
    @main_stations = MainStation.all
  end

  # GET /main_stations/1
  # GET /main_stations/1.json
  def show
  end

  # GET /main_stations/new
  def new
    @main_station = MainStation.new
  end

  # GET /main_stations/1/edit
  def edit
  end

  # POST /main_stations
  # POST /main_stations.json
  def create
    @main_station = MainStation.new(main_station_params)

    respond_to do |format|
      if @main_station.save
        format.html { redirect_to @main_station, notice: 'Main station was successfully created.' }
        format.json { render :show, status: :created, location: @main_station }
      else
        format.html { render :new }
        format.json { render json: @main_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_stations/1
  # PATCH/PUT /main_stations/1.json
  def update
    respond_to do |format|
      if @main_station.update(main_station_params)
        format.html { redirect_to @main_station, notice: 'Main station was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_station }
      else
        format.html { render :edit }
        format.json { render json: @main_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_stations/1
  # DELETE /main_stations/1.json
  def destroy
    @main_station.destroy
    respond_to do |format|
      format.html { redirect_to main_stations_url, notice: 'Main station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_station
      @main_station = MainStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_station_params
      params.require(:main_station).permit(:name, :money, :size, :defense, :armor, :shields, :weapons, :ships, :medical, :enemy)
    end
end
