class SmithsController < ApplicationController
  include MyUtility
  before_action :set_smith, only: [:show, :edit, :update, :destroy]

  # GET /smiths
  def index
    param_set
    @count	= Smith.includes(:p_name, :main_material_name, :sub_material_1_name, :sub_material_2_name, :sub_material_3_name, :sub_material_4_name, :main_material, :sub_material_1, :sub_material_2, :sub_material_3, :sub_material_4, :result, :source_last, source: [:kind_name, :ability_name]).search(params[:q]).result.count()
    @search	= Smith.includes(:p_name, :main_material_name, :sub_material_1_name, :sub_material_2_name, :sub_material_3_name, :sub_material_4_name, :main_material, :sub_material_1, :sub_material_2, :sub_material_3, :sub_material_4, :result, :source_last, source: [:kind_name, :ability_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @smiths	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "last_result_no", "last_result_no_form")
    reference_number_assign(params, "last_generate_no", "last_generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "sub_no", "sub_no_form")
    reference_text_assign(params, "main_material_name_name", "main_material_name_form")
    reference_text_assign(params, "sub_material_1_name_name_or_sub_material_2_name_name_or_sub_material_3_name_name_or_sub_material_4_name_name", "sub_material_name_form")
    reference_text_assign(params, "result_kind_name_name", "result_kind_form")
    reference_text_assign(params, "source_kind_name_name", "source_kind_form")
    reference_text_assign(params, "result_ability_name_name", "result_ability_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @last_result_no_form = params["last_result_no_form"]
    @last_generate_no_form = params["last_generate_no_form"]
    @party_no_form = params["party_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @main_material_name_form = params["main_material_name_form"]
    @sub_material_name_form = params["sub_material_name_form"]
    @result_kind_form = params["result_kind_form"]
    @source_kind_form = params["source_kind_form"]
    @result_ability_form = params["result_ability_form"]
        
  end
  # GET /smiths/1
  #def show
  #end

  # GET /smiths/new
  #def new
  #  @smith = Smith.new
  #end

  # GET /smiths/1/edit
  #def edit
  #end

  # POST /smiths
  #def create
  #  @smith = Smith.new(smith_params)

  #  if @smith.save
  #    redirect_to @smith, notice: 'Smith was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /smiths/1
  #def update
  #  if @smith.update(smith_params)
  #    redirect_to @smith, notice: 'Smith was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /smiths/1
  #def destroy
  #  @smith.destroy
  #  redirect_to smiths_url, notice: 'Smith was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smith
      @smith = Smith.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def smith_params
      params.require(:smith).permit(:result_no, :generate_no, :last_result_no, :last_generate_no, :party_no, :e_no, :sub_no, :result_i_no, :source_i_no, :main_material_i_no, :sub_material_1_i_no, :sub_material_2_i_no, :sub_material_3_i_no, :sub_material_4_i_no, :main_material_name_id, :sub_material_1_name_id, :sub_material_2_name_id, :sub_material_3_name_id, :sub_material_4_name_id)
    end
end
