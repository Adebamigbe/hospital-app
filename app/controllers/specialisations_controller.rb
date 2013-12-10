class SpecialisationsController < ApplicationController
  # GET /specialisations
  # GET /specialisations.json
  def index
    @specialisations = Specialisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specialisations }
    end
  end

  # GET /specialisations/1
  # GET /specialisations/1.json
  def show
    @specialisation = Specialisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @specialisation }
    end
  end

  # GET /specialisations/new
  # GET /specialisations/new.json
  def new
    @specialisation = Specialisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @specialisation }
    end
  end

  # GET /specialisations/1/edit
  def edit
    @specialisation = Specialisation.find(params[:id])
  end

  # POST /specialisations
  # POST /specialisations.json
  def create
    @specialisation = Specialisation.new(params[:specialisation])

    respond_to do |format|
      if @specialisation.save
        format.html { redirect_to @specialisation, notice: 'Specialisation was successfully created.' }
        format.json { render json: @specialisation, status: :created, location: @specialisation }
      else
        format.html { render action: "new" }
        format.json { render json: @specialisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /specialisations/1
  # PUT /specialisations/1.json
  def update
    @specialisation = Specialisation.find(params[:id])

    respond_to do |format|
      if @specialisation.update_attributes(params[:specialisation])
        format.html { redirect_to @specialisation, notice: 'Specialisation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @specialisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialisations/1
  # DELETE /specialisations/1.json
  def destroy
    @specialisation = Specialisation.find(params[:id])
    @specialisation.destroy

    respond_to do |format|
      format.html { redirect_to specialisations_url }
      format.json { head :no_content }
    end
  end
end
