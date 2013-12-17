require "json"

class HospitalSuggestionsController < ApplicationController
  # GET /hospital_suggestions
  # GET /hospital_suggestions.json
  def index
    hospital = Hospital.find(params[:hospital_id])
    hospital_suggestions = hospital.hospital_suggestions.where(active: true)

    @hospital_suggestions_with_specialisations = {}
    hospital_suggestions.each do |hospital_suggestion|
      @hospital_suggestions_with_specialisations[hospital_suggestion] = hospital_suggestion.specialisations
    end
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

    params[:specialisations_id].each do |specialisation_id|
      specialisation = Specialisation.find(specialisation_id)
      hospital_suggestion.specialisations << specialisation unless hospital.specialisations.include? specialisation
    end

    if not hospital_suggestion.specialisations.empty?
      hospital_suggestion.save
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

  def approve
    hospital = Hospital.find(params[:hospital_id])
    hospital_suggestion = HospitalSuggestion.find(params[:hospital_suggestion_id])

    hospital_suggestion.specialisations.each do |specialisation|
      hospital.specialisations << specialisation unless hospital.specialisations.include? specialisation
    end

    hospital_suggestion.active = false
    hospital_suggestion.status = "Approved"
    hospital_suggestion.save

    render json: {status: :approved}.to_json
  end

  def deny
    hospital_suggestion = HospitalSuggestion.find(params[:hospital_suggestion_id])
    hospital_suggestion.active = false
    hospital_suggestion.status = "Denied"
    hospital_suggestion.save

    render json: {status: :denied}.to_json
  end
end
