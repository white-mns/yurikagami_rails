class SkillsController < ApplicationController
  include MyUtility
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  def index
    placeholder_set
    param_set
    @count	= Skill.notnil().includes(:pc_name, [skill: [:timing, :target, :property, :element]]).ransack(params[:q]).result.hit_count()
    @search	= Skill.notnil().includes(:pc_name, [skill: [:timing, :target, :property, :element]]).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @skills	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_no", params_name: "sub_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_no", params_name: "skill_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_id", params_name: "skill_id_form", type: "number")

    params_to_form(params, @form_params, column_name: "skill_name", params_name: "name_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_at", params_name: "at_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_ct", params_name: "ct_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_timing_name", params_name: "timing_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_mp", params_name: "mp_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_target_name", params_name: "target_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_range", params_name: "range_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_property_name", params_name: "property_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_element_name", params_name: "element_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_text", params_name: "text_form", type: "number")

    checkbox_params_set_query_any(params, @form_params, query_name: "skill_range_eq_any",
                             checkboxes: [{params_name: "equip_range", value: -2},
                                          {params_name: "no_range", value: -1}])

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]

    toggle_params_to_variable(params, @form_params, params_name: "show_skill")
  end
  # GET /skills/1
  #def show
  #end

  # GET /skills/new
  #def new
  #  @skill = Skill.new
  #end

  # GET /skills/1/edit
  #def edit
  #end

  # POST /skills
  #def create
  #  @skill = Skill.new(skill_params)

  #  if @skill.save
  #    redirect_to @skill, notice: "Skill was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /skills/1
  #def update
  #  if @skill.update(skill_params)
  #    redirect_to @skill, notice: "Skill was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /skills/1
  #def destroy
  #  @skill.destroy
  #  redirect_to skills_url, notice: "Skill was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_params
      params.require(:skill).permit(:result_no, :generate_no, :e_no, :sub_no, :skill_no, :skill_id)
    end
end
