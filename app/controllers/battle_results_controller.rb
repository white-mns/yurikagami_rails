class BattleResultsController < ApplicationController
  include MyUtility
  before_action :set_battle_result, only: [:show, :edit, :update, :destroy]

  # GET /battle_results
  def index
    param_set
    @count	= BattleResult.includes(:income, enemy_party_info: [enemy_members: :enemy_name, current_place: [:place_name, party_info: [party_members: :p_name]]]).group(:party_no, :result_no).ransack(params[:q]).result.count().keys().size()
    @search	= BattleResult.includes(:income, enemy_party_info: [enemy_members: :enemy_name, current_place: [:place_name, party_info: [party_members: :p_name]]]).group(:party_no, :result_no).page(params[:page]).ransack(params[:q])
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
    reference_number_assign(params, "enemy_party_info_enemy_num", "enemy_num_form")
    reference_text_assign(params, "enemy_party_info_current_place_party_info_party_members_p_name_name", "p_name_form")
    reference_number_assign(params, "enemy_party_info_current_place_party_info_party_members_e_no", "e_no_form")
    reference_number_assign(params, "enemy_party_info_current_place_party_info_battler_num", "battler_num_form")
    reference_number_assign(params, "enemy_party_info_current_place_party_info_sook_num", "sook_num_form")
    reference_text_assign(params, "enemy_party_info_current_place_place_name_name", "place_form")
    reference_text_assign(params, "enemy_party_info_enemy_members_enemy_name_name", "enemy_form")
    reference_number_assign(params, "income_money", "money_form")
    reference_number_assign(params, "income_sundries", "sundries_form")
    reference_number_assign(params, "income_exp", "exp_form")
    reference_number_assign(params, "income_is_pk", "is_pk_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @battle_result_form = params["battle_result_form"]
    @enemy_num_form = params["enemy_num_form"]
    @p_name_form = params["p_name_form"]
    @e_no_form = params["e_no_form"]
    @enemy_form = params["enemy_form"]
    @battler_num_form = params["battler_num_form"]
    @sook_num_form = params["sook_num_form"]
    @place_form = params["place_form"]
    @sub_no_form = params["sub_no_form"]
    @money_form = params["money_form"]
    @sundries_form = params["sundries_form"]
    @exp_form = params["exp_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]

    params[:q]["battle_result_eq_any"] = []
    if params["is_draw"] == "on" then params[:q]["battle_result_eq_any"].push(0) end
    if params["is_win"] == "on" then params[:q]["battle_result_eq_any"].push(1) end
    if params["is_lose"] == "on" then params[:q]["battle_result_eq_any"].push(-1) end
    if params["is_unknown"] == "on" then params[:q]["battle_result_eq_any"].push(-2) end
    
    @is_lose = params["is_lose"]
    @is_draw = params["is_draw"]
    @is_win  = params["is_win"]
    @is_unknown  = params["is_unknown"]

    if params[:q]["battle_result_eq_any"].size == 0 then 
        @is_lose = "on"
        @is_draw = "on"
        @is_win  = "on"
        @is_unknown  = "on"
    end

    if @is_lose == "on" && @is_draw == "on" && @is_win == "on" then
        @is_unknown  = "on"
    end

    params[:q]["income_is_pk_eq_any"] = []
    if params["is_enemy"] == "on" then params[:q]["income_is_pk_eq_any"].push(0) end
    if params["is_practice"] == "on" then params[:q]["income_is_pk_eq_any"].push(1) end
    if params["is_pk"] == "on" then params[:q]["income_is_pk_eq_any"].push(2) end
    
    @is_pk = params["is_pk"]
    @is_enemy  = params["is_enemy"]
    @is_practice  = params["is_practice"]

    if params[:q]["income_is_pk_eq_any"].size == 0 then 
        @is_pk       = "on"
        @is_enemy    = "on"
        @is_practice = "on"
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
