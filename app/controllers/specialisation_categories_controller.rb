class SpecialisationCategoriesController < ApplicationController
  # GET /specialisation_categories
  # GET /specialisation_categories.json
  def index
    @specialisation_categories = SpecialisationCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specialisation_categories }
    end
  end

  # GET /specialisation_categories/1
  # GET /specialisation_categories/1.json
  def show
    @specialisation_category = SpecialisationCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @specialisation_category }
    end
  end

  # GET /specialisation_categories/new
  # GET /specialisation_categories/new.json
  def new
    @specialisation_category = SpecialisationCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @specialisation_category }
    end
  end

  # GET /specialisation_categories/1/edit
  def edit
    @specialisation_category = SpecialisationCategory.find(params[:id])
  end

  # POST /specialisation_categories
  # POST /specialisation_categories.json
  def create
    @specialisation_category = SpecialisationCategory.new(params[:specialisation_category])

    respond_to do |format|
      if @specialisation_category.save
        format.html { redirect_to @specialisation_category, notice: 'Specialisation category was successfully created.' }
        format.json { render json: @specialisation_category, status: :created, location: @specialisation_category }
      else
        format.html { render action: "new" }
        format.json { render json: @specialisation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /specialisation_categories/1
  # PUT /specialisation_categories/1.json
  def update
    @specialisation_category = SpecialisationCategory.find(params[:id])

    respond_to do |format|
      if @specialisation_category.update_attributes(params[:specialisation_category])
        format.html { redirect_to @specialisation_category, notice: 'Specialisation category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @specialisation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialisation_categories/1
  # DELETE /specialisation_categories/1.json
  def destroy
    @specialisation_category = SpecialisationCategory.find(params[:id])
    @specialisation_category.destroy

    respond_to do |format|
      format.html { redirect_to specialisation_categories_url }
      format.json { head :no_content }
    end
  end
end
