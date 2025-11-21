class BattleResultsController < ApplicationController
  include MyUtility
  before_action :set_battle_result, only: [:show, :edit, :update, :destroy]

  # GET /battle_results
  def index
    placeholder_set
    param_set
    @count	= BattleResult.notnil().includes([current_place: :place], [party_info: [party_members: :pc_name]], :enemy_party_info, [enemy_members: :enemy]).ransack(params[:q]).result.hit_count()
    @search	= BattleResult.notnil().includes([current_place: :place], [party_info: [party_members: :pc_name]], :enemy_party_info, [enemy_members: :enemy]).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @battle_results	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf("%d",@latest_result)
    end

    params_to_form(params, @form_params, column_name: "pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "battle_result", params_name: "battle_result_form", type: "number")

    params_to_form(params, @form_params, column_name: "party_info_party_members_pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "party_info_party_members_e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_info_battler_num", params_name: "battler_num_form", type: "number")
    params_to_form(params, @form_params, column_name: "current_place_place_name", params_name: "place_form", type: "text")
    params_to_form(params, @form_params, column_name: "enemy_members_enemy_name", params_name: "enemy_form", type: "text")
    params_to_form(params, @form_params, column_name: "enemy_party_info_enemy_num", params_name: "enemy_num_form", type: "number")

    checkbox_params_set_query_any(params, @form_params, query_name: "is_pk_eq_any",
                             checkboxes: [{params_name: "is_enemy", value: 0, first_checked: true},
                                          {params_name: "is_practice", value: 1, first_checked: true},
                                          {params_name: "is_pk", value: 2, first_checked: true}])

    checkbox_params_set_query_any(params, @form_params, query_name: "battle_result_eq_any",
                             checkboxes: [{params_name: "is_draw", value: 0, first_checked: true},
                                          {params_name: "is_win", value: 1, first_checked: true},
                                          {params_name: "is_lose", value: -1, first_checked: true},
                                          {params_name: "is_unknown", value: -2, first_checked: true}])

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]

    toggle_params_to_variable(params, @form_params, params_name: "show_current_place", first_opened: true)
    toggle_params_to_variable(params, @form_params, params_name: "show_num")
    toggle_params_to_variable(params, @form_params, params_name: "show_is_pk")
    @form_params["base_first"]    = (!params["is_form"]) ? "1" : "0"
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
  #    redirect_to @battle_result, notice: "Battle result was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /battle_results/1
  #def update
  #  if @battle_result.update(battle_result_params)
  #    redirect_to @battle_result, notice: "Battle result was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /battle_results/1
  #def destroy
  #  @battle_result.destroy
  #  redirect_to battle_results_url, notice: "Battle result was successfully destroyed."
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
