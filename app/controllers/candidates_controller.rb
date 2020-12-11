# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show edit update destroy vote]
  before_action :verify_owner, only: %i[edit update destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    @candidate =
      if helpers.voting_over?
        Candidate.all.order(vote_count: :desc)
      else
        Candidate.all.order(last_name: :desc)
      end
  end

  # GET /candidates/new
  def new
    if helpers.within_nominations_period?
      @candidate = Candidate.new
    else
      flash[:warning] = 'Nominations are not currently open.'
      redirect_to candidates_path
    end
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /candidates/1/vote
  def vote
    if helpers.within_voting_period?
      if current_user.votes.count > 5
        redirect_to candidates_path, notice: "You've hit your maximum (5) number of allowed votes."
      else
        vote = current_user.votes.find_by(candidate: @candidate)
        if vote.present?
          vote.destroy!
          redirect_to candidates_path, notice: 'You have removed your vote.'
        else
          current_user.votes.create!(candidate: @candidate)
          redirect_to candidates_path, notice: 'You voted! Yay!'
        end
      end
    else
      flash[:warning] = 'Voting is not currently open; you cannot vote.'
      redirect_to candidates_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def candidate_params
    params.require(:candidate)
          .permit(:first_name, :last_name, :bio, :professional, :why)
          .merge(user_id: current_user.id)
  end

  def verify_owner
    return @candidate.user_id == current_user.id
    flash[:warning] = 'You can only make changes to your own candidacy.'
    redirect_to candidates_path
  end
end
