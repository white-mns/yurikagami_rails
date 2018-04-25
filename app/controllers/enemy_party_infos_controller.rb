class EnemyPartyInfosController < ApplicationController
  include MyUtility
  before_action :set_enemy_party_info, only: [:show, :edit, :update, :destroy]

  # GET /enemy_party_infos
  def index
    param_set
    @count	= EnemyPartyInfo.includes([:p_name]).search(params[:q]).result.count()
    @search	= EnemyPartyInfo.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @enemy_party_infos	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "result_no", "result_no_form")
        reference_number_assign(params, "generate_no", "generate_no_form")
        reference_number_assign(params, "party_no", "party_no_form")
        reference_number_assign(params, "enemy_num", "enemy_num_form")
        
    @p_name_form = params["p_name_form"]
        @result_no_form = params["result_no_form"]
        @generate_no_form = params["generate_no_form"]
        @party_no_form = params["party_no_form"]
        @enemy_num_form = params["enemy_num_form"]
        
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
