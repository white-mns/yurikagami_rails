class SmithsController < ApplicationController
  include MyUtility
  before_action :set_smith, only: [:show, :edit, :update, :destroy]

  # GET /smiths
  def index
    placeholder_set
    param_set
    @count	= Smith.notnil().includes(:pc_name, :main_material_name, :sub_material_1_name, :sub_material_2_name, :sub_material_3_name, :sub_material_4_name, :main_material, :sub_material_1, :sub_material_2, :sub_material_3, :sub_material_4, [result: [:kind, :ability]], [source_last: [:kind, :ability]], [source: [:kind, :ability]]).search(params[:q]).result.hit_count()
    @search	= Smith.notnil().includes(:pc_name, :main_material_name, :sub_material_1_name, :sub_material_2_name, :sub_material_3_name, :sub_material_4_name, :main_material, :sub_material_1, :sub_material_2, :sub_material_3, :sub_material_4, [result: [:kind, :ability]], [source_last: [:kind, :ability]], [source: [:kind, :ability]]).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @smiths	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "last_result_no", params_name: "last_result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "last_generate_no", params_name: "last_generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_no", params_name: "sub_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_i_no", params_name: "result_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "source_i_no", params_name: "source_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "main_material_i_no", params_name: "main_material_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_1_i_no", params_name: "sub_material_1_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_2_i_no", params_name: "sub_material_2_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_3_i_no", params_name: "sub_material_3_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_4_i_no", params_name: "sub_material_4_i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "main_material_name_id", params_name: "main_material_name_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_1_name_id", params_name: "sub_material_1_name_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_2_name_id", params_name: "sub_material_2_name_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_3_name_id", params_name: "sub_material_3_name_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_material_4_name_id", params_name: "sub_material_4_name_id_form", type: "number")

    params_to_form(params, @form_params, column_name: "result_name", params_name: "result_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "source_name", params_name: "source_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_kind_name", params_name: "kind_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_slash", params_name: "result_slash_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_charge", params_name: "result_charge_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_magic", params_name: "result_magic_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_guard", params_name: "result_guard_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_protect", params_name: "result_protect_form", type: "number")
    params_to_form(params, @form_params, column_name: "result_ability_name", params_name: "result_ability_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_prize", params_name: "result_prize_form", type: "number")
    params_to_form(params, @form_params, column_name: "main_material_name", params_name: "main_material_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "sub_material_1_name_name_or_sub_material_2_name_name_or_sub_material_3_name_name_or_sub_material_4_name_name", params_name: "sub_material_name_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]

    toggle_params_to_variable(params, @form_params, params_name: "show_result_detail", first_opened: true)
    toggle_params_to_variable(params, @form_params, params_name: "show_material")
    @form_params["base_first"]    = (!params["is_form"]) ? "1" : "0"
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
  #    redirect_to @smith, notice: "Smith was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /smiths/1
  #def update
  #  if @smith.update(smith_params)
  #    redirect_to @smith, notice: "Smith was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /smiths/1
  #def destroy
  #  @smith.destroy
  #  redirect_to smiths_url, notice: "Smith was successfully destroyed."
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
