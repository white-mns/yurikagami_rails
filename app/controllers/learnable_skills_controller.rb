class LearnableSkillsController < ApplicationController
  include MyUtility
  before_action :set_learnable_skill, only: [:show, :edit, :update, :destroy]

  # GET /learnable_skills
  def index
    param_set
    @count	= LearnableSkill.includes([:p_name]).search(params[:q]).result.count()
    @search	= LearnableSkill.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @learnable_skills	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "chara_type", "chara_type_form")
        reference_number_assign(params, "job_id", "job_id_form")
        reference_number_assign(params, "sp", "sp_form")
        reference_number_assign(params, "skill_no", "skill_no_form")
        reference_number_assign(params, "skill_id", "skill_id_form")
        
    @p_name_form = params["p_name_form"]
        @chara_type_form = params["chara_type_form"]
        @job_id_form = params["job_id_form"]
        @sp_form = params["sp_form"]
        @skill_no_form = params["skill_no_form"]
        @skill_id_form = params["skill_id_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
