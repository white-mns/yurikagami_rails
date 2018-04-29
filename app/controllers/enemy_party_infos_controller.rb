class EnemyPartyInfosController < ApplicationController
  include MyUtility
  before_action :set_enemy_party_info, only: [:show, :edit, :update, :destroy]

  # GET /enemy_party_infos
  def index
    param_set
    @count	= EnemyPartyInfo.includes(enemy_members: :enemy_name, current_place: [:place_name, party_info: [party_members: :p_name]]).group(:party_no, :result_no).search(params[:q]).result.count().keys().size
    @search	= EnemyPartyInfo.includes(enemy_members: :enemy_name, current_place: [:place_name, party_info: [party_members: :p_name]]).group(:party_no, :result_no).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @enemy_party_infos	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_number_assign(params, "enemy_num", "enemy_num_form")
    reference_text_assign(params, "current_place_party_info_party_members_p_name_name", "p_name_form")
    reference_number_assign(params, "current_place_party_info_party_members_e_no", "e_no_form")
    reference_number_assign(params, "current_place_party_info_battler_num", "battler_num_form")
    reference_text_assign(params, "current_place_place_name_name", "place_form")
    reference_text_assign(params, "enemy_members_enemy_name_name", "enemy_form")
    
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @enemy_num_form = params["enemy_num_form"]
    @p_name_form = params["p_name_form"]
    @e_no_form = params["e_no_form"]
    @enemy_form = params["enemy_form"]
    @battler_num_form = params["battler_num_form"]
    @place_form = params["place_form"]
    @money_form = params["money_form"]
    @sundries_form = params["sundries_form"]
    @exp_form = params["exp_form"]
    @is_pk_form = params["is_pk_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
  #    redirect_to @enemy_party_info, notice: 'Enemy party info was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /enemy_party_infos/1
  #def update
  #  if @enemy_party_info.update(enemy_party_info_params)
  #    redirect_to @enemy_party_info, notice: 'Enemy party info was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /enemy_party_infos/1
  #def destroy
  #  @enemy_party_info.destroy
  #  redirect_to enemy_party_infos_url, notice: 'Enemy party info was successfully destroyed.'
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
