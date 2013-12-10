class HospitalSuggestionsController < ApplicationController
  # GET /hospital_suggestions
  # GET /hospital_suggestions.json
  def index
    @hospital_suggestions = HospitalSuggestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hospital_suggestions }
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
    @hospital_suggestion = HospitalSuggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hospital_suggestion }
    end
  end

  # GET /hospital_suggestions/1/edit
  def edit
    @hospital_suggestion = HospitalSuggestion.find(params[:id])
  end

  # POST /hospital_suggestions
  # POST /hospital_suggestions.json
  def create
    @hospital_suggestion = HospitalSuggestion.new(params[:hospital_suggestion])

    respond_to do |format|
      if @hospital_suggestion.save
        format.html { redirect_to @hospital_suggestion, notice: 'Hospital suggestion was successfully created.' }
        format.json { render json: @hospital_suggestion, status: :created, location: @hospital_suggestion }
      else
        format.html { render action: "new" }
        format.json { render json: @hospital_suggestion.errors, status: :unprocessable_entity }
      end
    end
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
