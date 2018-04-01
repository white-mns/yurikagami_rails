class PartyInfosController < ApplicationController
  include MyUtility
  before_action :set_party_info, only: [:show, :edit, :update, :destroy]

  # GET /party_infos
  def index
    param_set
    @count	= PartyInfo.includes(party_members: :p_name).search(params[:q]).result.count()
    @search	= PartyInfo.includes(party_members: :p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @party_infos	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "party_members_p_name_name", "p_name_form")
    reference_number_assign(params, "party_members_e_no", "e_no_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_text_assign(params, "name", "name_form")
    reference_number_assign(params, "member_num", "member_num_form")
    reference_number_assign(params, "battler_num", "battler_num_form")
    reference_number_assign(params, "sook_num", "sook_num_form")
        
    @p_name_form = params["p_name_form"]
    @e_no_form = params["e_no_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @name_form = params["name_form"]
    @member_num_form = params["member_num_form"]
    @battler_num_form = params["battler_num_form"]
    @sook_num_form = params["sook_num_form"]
  end
  # GET /party_infos/1
  #def show
  #end

  # GET /party_infos/new
  #def new
  #  @party_info = PartyInfo.new
  #end

  # GET /party_infos/1/edit
  #def edit
  #end

  # POST /party_infos
  #def create
  #  @party_info = PartyInfo.new(party_info_params)

  #  if @party_info.save
  #    redirect_to @party_info, notice: 'Party info was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /party_infos/1
  #def update
  #  if @party_info.update(party_info_params)
  #    redirect_to @party_info, notice: 'Party info was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /party_infos/1
  #def destroy
  #  @party_info.destroy
  #  redirect_to party_infos_url, notice: 'Party info was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_info
      @party_info = PartyInfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def party_info_params
      params.require(:party_info).permit(:result_no, :generate_no, :party_no, :name, :member_num, :battler_num, :sook_num)
    end
end
