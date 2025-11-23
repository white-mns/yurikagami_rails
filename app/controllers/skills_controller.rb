class SkillsController < ApplicationController
  include MyUtility
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  def index
    param_set
    @count	= Skill.includes([:p_name, :skill_data]).ransack(params[:q]).result.count()
    @search	= Skill.includes([:p_name, :skill_data]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @skills	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "sub_no", "sub_no_form")
    reference_number_assign(params, "skill_no", "skill_no_form")
    reference_text_assign(params, "skill_data_name", "skill_id_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @skill_no_form = params["skill_no_form"]
    @skill_id_form = params["skill_id_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
  #    redirect_to @skill, notice: 'Skill was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /skills/1
  #def update
  #  if @skill.update(skill_params)
  #    redirect_to @skill, notice: 'Skill was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /skills/1
  #def destroy
  #  @skill.destroy
  #  redirect_to skills_url, notice: 'Skill was successfully destroyed.'
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
