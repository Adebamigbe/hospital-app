class HospitalSuggestionsController < ApplicationController
  # GET /hospital_suggestions
  # GET /hospital_suggestions.json
  def index

  end

  # GET /hospital_suggestions/1
  # GET /hospital_suggestions/1.json
  def show
    @hospital_suggestion = HospitalSuggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hospital_suggestion }
    end
  end

  # GET /hospital_suggestions/new
  # GET /hospital_suggestions/new.json
  def new
    hospital = Hospital.find(params[:hospital_id])
    hospital_specialisations = hospital.specialisations

    specialisation_categories = SpecialisationCategory.all
    @specialisation_categories_hash = {}

    specialisation_categories.each do |specialisation_category|
      @specialisation_categories_hash[specialisation_category] = []

      specialisation_category.specialisations.each do |specialisation|
        specialisation.show_checked = true if hospital_specialisations.include? specialisation
        @specialisation_categories_hash[specialisation_category] << specialisation
      end
    end
  end

  # GET /hospital_suggestions/1/edit
  def edit
    @hospital_suggestion = HospitalSuggestion.find(params[:id])
  end

  # POST /hospital_suggestions
  # POST /hospital_suggestions.json
  def create
    hospital = Hospital.find(params[:hospital_id])
    hospital_suggestion = HospitalSuggestion.new
    hospital_suggestion.hospital = hospital
    # hospital_suggestion.user = current_user
    hospital_suggestion.save

    params[:specialisations_id].each do |specialisation_id|
      specialisation = Specialisation.find(specialisation_id)
      hospital_suggestion.specialisations << specialisation unless hospital.specialisations.include? specialisation
    end


    redirect_to(hospital)
  end

  # PUT /hospital_suggestions/1
  # PUT /hospital_suggestions/1.json
  def update
    @hospital_suggestion = HospitalSuggestion.find(params[:id])

    respond_to do |format|
      if @hospital_suggestion.update_attributes(params[:hospital_suggestion])
        format.html { redirect_to @hospital_suggestion, notice: 'Hospital suggestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hospital_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_suggestions/1
  # DELETE /hospital_suggestions/1.json
  def destroy
    @hospital_suggestion = HospitalSuggestion.find(params[:id])
    @hospital_suggestion.destroy

    respond_to do |format|
      format.html { redirect_to hospital_suggestions_url }
      format.json { head :no_content }
    end
  end
end
