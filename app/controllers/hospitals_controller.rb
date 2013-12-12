class HospitalsController < ApplicationController
  # GET /hospitals
  # GET /hospitals.json
  def index
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hospital }
    end
  end

  # GET /hospitals/new
  # GET /hospitals/new.json
  def new
    @hospital = Hospital.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hospital }
    end
  end

  # GET /hospitals/1/edit
  def edit
    @hospital = Hospital.find(params[:id])
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = Hospital.new(params[:hospital])

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully created.' }
        format.json { render json: @hospital, status: :created, location: @hospital }
      else
        format.html { render action: "new" }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hospitals/1
  # PUT /hospitals/1.json
  def update
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      if @hospital.update_attributes(params[:hospital])
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy

    respond_to do |format|
      format.html { redirect_to hospitals_url }
      format.json { head :no_content }
    end
  end

  # POST /hospitals/search
  def search
    address = params[:search]
    geo = Geocoder.search(address).first
    location = geo.geometry["location"]
    lat = location["lat"]
    lng = location["lng"]

    search = Search.create(address: address, lat: lat, lng: lng)

    results = SearchHelper.search(lat, lng)
    results.each do |hospital_result|
      hospital = Hospital.new
      hospital.name = hospital_result["name"]
      hospital.api_id = hospital_result["id"]
      hospital.address = hospital_result["vicinity"]
      hospital.lat = hospital_result["geometry"]["location"]["lat"]
      hospital.lng = hospital_result["geometry"]["location"]["lng"]
      hospital.save

      hospital_result["app_id"] = hospital.id
    end

    render json: results
  end

end
