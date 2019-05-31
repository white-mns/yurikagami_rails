class LearnableSkillsController < ApplicationController
  include MyUtility
  before_action :set_learnable_skill, only: [:show, :edit, :update, :destroy]

  # GET /learnable_skills
  def index
    placeholder_set
    param_set
    @count	= LearnableSkill.includes(:job, [skill: [:timing, :target, :property, :element]]).search(params[:q]).result.hit_count()
    @search	= LearnableSkill.includes(:job, [skill: [:timing, :target, :property, :element]]).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @learnable_skills	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf("%d",@latest_result)
    end

    params_to_form(params, @form_params, column_name: "pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "chara_type", params_name: "chara_type_form", type: "number")
    params_to_form(params, @form_params, column_name: "job_name", params_name: "job_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_no", params_name: "skill_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sp", params_name: "sp_form", type: "number")
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

    checkbox_params_set_query_any(params, @form_params, query_name: "chara_type_eq_any",
                             checkboxes: [{params_name: "is_main", value: 0},
                                          {params_name: "is_sub", value: 1}])

    checkbox_params_set_query_any(params, @form_params, query_name: "skill_range_eq_any",
                             checkboxes: [{params_name: "equip_range", value: -2},
                                          {params_name: "no_range", value: -1}])

    toggle_params_to_variable(params, @form_params, params_name: "show_skill", first_opened: true)
    @form_params["base_first"] = (!params["is_form"]) ? "1" : "0"
  end
  # GET /learnable_skills/1
  #def show
  #end

  # GET /learnable_skills/new
  #def new
  #  @learnable_skill = LearnableSkill.new
  #end

  # GET /learnable_skills/1/edit
  #def edit
  #end

  # POST /learnable_skills
  #def create
  #  @learnable_skill = LearnableSkill.new(learnable_skill_params)

  #  if @learnable_skill.save
  #    redirect_to @learnable_skill, notice: "Learnable skill was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /learnable_skills/1
  #def update
  #  if @learnable_skill.update(learnable_skill_params)
  #    redirect_to @learnable_skill, notice: "Learnable skill was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /learnable_skills/1
  #def destroy
  #  @learnable_skill.destroy
  #  redirect_to learnable_skills_url, notice: "Learnable skill was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learnable_skill
      @learnable_skill = LearnableSkill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def learnable_skill_params
      params.require(:learnable_skill).permit(:chara_type, :job_id, :skill_no, :sp, :skill_id)
    end
end
