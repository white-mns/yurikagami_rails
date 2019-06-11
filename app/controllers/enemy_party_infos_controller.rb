class EnemyPartyInfosController < ApplicationController
  include MyUtility
  before_action :set_enemy_party_info, only: [:show, :edit, :update, :destroy]

  # GET /enemy_party_infos
  def index
    placeholder_set
    param_set
    @count	= EnemyPartyInfo.notnil().includes([enemy_members: :enemy], [current_place: :place], [party_info: [party_members: :pc_name]]).search(params[:q]).result.hit_count()
    @search	= EnemyPartyInfo.notnil().includes([enemy_members: :enemy], [current_place: :place], [party_info: [party_members: :pc_name]]).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @enemy_party_infos	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf("%d",@latest_result)
    end

    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "enemy_num", params_name: "enemy_num_form", type: "number")

    params_to_form(params, @form_params, column_name: "party_info_party_members_pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "party_info_party_members_e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_info_battler_num", params_name: "battler_num_form", type: "number")
    params_to_form(params, @form_params, column_name: "current_place_place_name", params_name: "place_form", type: "text")
    params_to_form(params, @form_params, column_name: "enemy_members_enemy_name", params_name: "enemy_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /enemy_party_infos/1
  #def show
  #end

  # GET /enemy_party_infos/new
  #def new
  #  @enemy_party_info = EnemyPartyInfo.new
  #end

  # GET /enemy_party_infos/1/edit
  #def edit
  #end

  # POST /enemy_party_infos
  #def create
  #  @enemy_party_info = EnemyPartyInfo.new(enemy_party_info_params)

  #  if @enemy_party_info.save
  #    redirect_to @enemy_party_info, notice: "Enemy party info was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /enemy_party_infos/1
  #def update
  #  if @enemy_party_info.update(enemy_party_info_params)
  #    redirect_to @enemy_party_info, notice: "Enemy party info was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /enemy_party_infos/1
  #def destroy
  #  @enemy_party_info.destroy
  #  redirect_to enemy_party_infos_url, notice: "Enemy party info was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enemy_party_info
      @enemy_party_info = EnemyPartyInfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enemy_party_info_params
      params.require(:enemy_party_info).permit(:result_no, :generate_no, :party_no, :enemy_num)
    end
end
