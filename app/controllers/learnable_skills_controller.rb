class LearnableSkillsController < ApplicationController
  include MyUtility
  before_action :set_learnable_skill, only: [:show, :edit, :update, :destroy]

  # GET /learnable_skills
  def index
    param_set
    @count	= LearnableSkill.includes(:job_name, skill_data: [:timing_name, :target_name, :property_name, :element_name]).search(params[:q]).result.count()
    @search	= LearnableSkill.includes(:job_name, skill_data: [:timing_name, :target_name, :property_name, :element_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @learnable_skills	= @search.result.per(50)
  end

  def param_set
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "chara_type", "chara_type_form")
    reference_text_assign(params, "job_name_name", "job_id_form")
    reference_number_assign(params, "sp", "sp_form")
    reference_number_assign(params, "skill_no", "skill_no_form")
    reference_text_assign(params, "skill_data_name", "skill_id_form")
    reference_number_assign(params, "skill_data_at", "at_form")
    reference_number_assign(params, "skill_data_ct", "ct_form")
    reference_text_assign(params, "skill_data_timing_name_name", "timing_form")
    reference_number_assign(params, "skill_data_mp", "mp_form")
    reference_text_assign(params, "skill_data_target_name_name", "target_form")
    reference_number_assign(params, "skill_data_range", "range_form")
    reference_text_assign(params, "skill_data_property_name_name", "property_form")
    reference_text_assign(params, "skill_data_element_name_name", "element_form")
    reference_text_assign(params, "skill_data_text", "text_form")
        
    @chara_type_form = params["chara_type_form"]
    @job_id_form = params["job_id_form"]
    @sp_form = params["sp_form"]
    @skill_no_form = params["skill_no_form"]
    @skill_id_form = params["skill_id_form"]
    @at_form = params["at_form"]
    @ct_form = params["ct_form"]
    @timing_form = params["timing_form"]
    @mp_form = params["mp_form"]
    @target_form = params["target_form"]
    @range_form = params["range_form"]
    @property_form = params["property_form"]
    @element_form = params["element_form"]
    @text_form = params["text_form"]
        
    params[:q]["chara_type_eq_any"]  = params[:q]["chara_type_eq_any"] ? params[:q]["chara_type_eq_any"] : []

    if params["show_main"] == "on" then params[:q]["chara_type_eq_any"].push(0) end
    if params["show_sub"] == "on" then
        params[:q]["chara_type_eq_any"].push(1)
    end
    
    if params[:q]["chara_type_eq_any"].size == 0 then 
        params["show_main"] = "on"
        params[:q]["chara_type_eq_any"].push(0)
    end

    @show_main = params["show_main"]
    @show_sub = params["show_sub"]

    params[:q]["skill_data_range_eq_any"] = []
    if params["equip_range"] == "on" then params[:q]["skill_data_range_eq_any"].push(-2) end
    if params["no_range"] == "on" then params[:q]["skill_data_range_eq_any"].push(-1) end
    @equip_range = params["equip_range"]
    @no_range  = params["no_range"]
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
  #    redirect_to @learnable_skill, notice: 'Learnable skill was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /learnable_skills/1
  #def update
  #  if @learnable_skill.update(learnable_skill_params)
  #    redirect_to @learnable_skill, notice: 'Learnable skill was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /learnable_skills/1
  #def destroy
  #  @learnable_skill.destroy
  #  redirect_to learnable_skills_url, notice: 'Learnable skill was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learnable_skill
      @learnable_skill = LearnableSkill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def learnable_skill_params
      params.require(:learnable_skill).permit(:chara_type, :job_id, :sp, :skill_no, :skill_id)
    end
end
