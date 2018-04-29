class BattleResultsController < ApplicationController
  include MyUtility
  before_action :set_battle_result, only: [:show, :edit, :update, :destroy]

  # GET /battle_results
  def index
    param_set
    @count	= BattleResult.search(params[:q]).result.count()
    @search	= BattleResult.page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @battle_results	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_number_assign(params, "battle_result", "battle_result_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @battle_result_form = params["battle_result_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]

    params[:q]["battle_result_eq_any"] = []
    if params["is_draw"] == "on" then params[:q]["battle_result_eq_any"].push(0) end
    if params["is_win"] == "on" then params[:q]["battle_result_eq_any"].push(1) end
    if params["is_lose"] == "on" then params[:q]["battle_result_eq_any"].push(-1) end
    
    @is_lose = params["is_lose"]
    @is_draw  = params["is_draw"]
    @is_win  = params["is_win"]

    if params[:q]["battle_result_eq_any"].size == 0 then 
        @is_lose = "on"
        @is_draw = "on"
        @is_win  = "on"
    end
  end
  # GET /battle_results/1
  #def show
  #end

  # GET /battle_results/new
  #def new
  #  @battle_result = BattleResult.new
  #end

  # GET /battle_results/1/edit
  #def edit
  #end

  # POST /battle_results
  #def create
  #  @battle_result = BattleResult.new(battle_result_params)

  #  if @battle_result.save
  #    redirect_to @battle_result, notice: 'Battle result was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /battle_results/1
  #def update
  #  if @battle_result.update(battle_result_params)
  #    redirect_to @battle_result, notice: 'Battle result was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /battle_results/1
  #def destroy
  #  @battle_result.destroy
  #  redirect_to battle_results_url, notice: 'Battle result was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle_result
      @battle_result = BattleResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def battle_result_params
      params.require(:battle_result).permit(:result_no, :generate_no, :party_no, :battle_result)
    end
end
