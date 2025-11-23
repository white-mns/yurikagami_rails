class PartyInfosController < ApplicationController
  include MyUtility
  before_action :set_party_info, only: [:show, :edit, :update, :destroy]

  # GET /party_infos
  def index
    placeholder_set
    param_set
    @count	= PartyInfo.notnil().includes(party_members: :pc_name).ransack(params[:q]).result.hit_count()
    @search	= PartyInfo.notnil().includes(party_members: :pc_name).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @party_infos	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf("%d",@latest_result)
        params["member_num_form"] ||= "1~"
    end

    params_to_form(params, @form_params, column_name: "party_members_pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "party_members_e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "name", params_name: "name_form", type: "text")
    params_to_form(params, @form_params, column_name: "member_num", params_name: "member_num_form", type: "number")
    params_to_form(params, @form_params, column_name: "battler_num", params_name: "battler_num_form", type: "number")

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
  #    redirect_to @party_info, notice: "Party info was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /party_infos/1
  #def update
  #  if @party_info.update(party_info_params)
  #    redirect_to @party_info, notice: "Party info was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /party_infos/1
  #def destroy
  #  @party_info.destroy
  #  redirect_to party_infos_url, notice: "Party info was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_info
      @party_info = PartyInfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def party_info_params
      params.require(:party_info).permit(:result_no, :generate_no, :party_no, :name, :member_num, :battler_num)
    end
end
