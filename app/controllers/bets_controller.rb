class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  before_action :set_match
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  before_action :is_owner_or_admin, only: [:edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do 
    require_bet_active(@bet)
  end

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all.includes(match: [:country_a, :country_b])
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    if @match.are_bets_active
      if !(bet = Bet.where(match: @match, user: current_user)).empty?
        @bet=bet.first
        redirect_to edit_match_bet_path(@bet, match_id: @match.id)
      end
      @bet = Bet.new
      @bet.match = @match
    else
      redirect_to all_bets_path, alert: t('errors.messages.bet_disabled')
    end
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.match = @match
    respond_to do |format|
      if @bet.save
        format.html { redirect_to match_bet_path(@bet, match_id: @match.id), notice: t('.created') }
        format.json { render :show, status: :created, location: @bet }
      else
        #byebug
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to match_bet_path(@bet, match_id: @match.id), notice: t('.updated') }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to match_bets_url(match_id: @match.id), notice: t('.destroyed') }
      format.json { head :no_content }
    end
  end
  
  def my_bets
    @bets = Bet.where(user: current_user).includes(match: [:country_a, :country_b])
  end
  
  def is_owner_or_admin
    @bet.user == current_user || current_user.is_admin
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end
    
    def set_match
      if params.has_key?(:match_id)
        @match = Match.find(params[:match_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:score_a, :score_b)
    end
end
