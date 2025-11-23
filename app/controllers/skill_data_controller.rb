class SkillDataController < ApplicationController
  include MyUtility
  before_action :set_skill_datum, only: [:show, :edit, :update, :destroy]

  # GET /skill_data
  def index
    placeholder_set
    param_set
    @count	= SkillDatum.includes(:timing, :target, :property, :element).ransack(params[:q]).result.hit_count()
    @search	= SkillDatum.includes(:timing, :target, :property, :element).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @skill_data	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf("%d",@latest_result)
    end

    params_to_form(params, @form_params, column_name: "skill_id", params_name: "skill_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "name", params_name: "name_form", type: "text")
    params_to_form(params, @form_params, column_name: "at", params_name: "at_form", type: "number")
    params_to_form(params, @form_params, column_name: "ct", params_name: "ct_form", type: "number")
    params_to_form(params, @form_params, column_name: "timing_name", params_name: "timing_form", type: "text")
    params_to_form(params, @form_params, column_name: "mp", params_name: "mp_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_name", params_name: "target_form", type: "text")
    params_to_form(params, @form_params, column_name: "range", params_name: "range_form", type: "number")
    params_to_form(params, @form_params, column_name: "property_name", params_name: "property_form", type: "text")
    params_to_form(params, @form_params, column_name: "element_name", params_name: "element_form", type: "text")
    params_to_form(params, @form_params, column_name: "text", params_name: "text_form", type: "number")

    checkbox_params_set_query_any(params, @form_params, query_name: "range_eq_any",
                             checkboxes: [{params_name: "equip_range", value: -2},
                                          {params_name: "no_range", value: -1}])

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /skill_data/1
  #def show
  #end

  # GET /skill_data/new
  #def new
  #  @skill_datum = SkillDatum.new
  #end

  # GET /skill_data/1/edit
  #def edit
  #end

  # POST /skill_data
  #def create
  #  @skill_datum = SkillDatum.new(skill_datum_params)

  #  if @skill_datum.save
  #    redirect_to @skill_datum, notice: "Skill datum was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /skill_data/1
  #def update
  #  if @skill_datum.update(skill_datum_params)
  #    redirect_to @skill_datum, notice: "Skill datum was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /skill_data/1
  #def destroy
  #  @skill_datum.destroy
  #  redirect_to skill_data_url, notice: "Skill datum was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_datum
      @skill_datum = SkillDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_datum_params
      params.require(:skill_datum).permit(:skill_id, :name, :at, :ct, :timing_id, :mp, :target_id, :range, :property_id, :element_id, :text)
    end
end
