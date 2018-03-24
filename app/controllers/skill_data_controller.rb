class SkillDataController < ApplicationController
  include MyUtility
  before_action :set_skill_datum, only: [:show, :edit, :update, :destroy]

  # GET /skill_data
  def index
    param_set
    @count	= SkillDatum.includes([:p_name]).search(params[:q]).result.count()
    @search	= SkillDatum.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @skill_data	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "skill_id", "skill_id_form")
        reference_number_assign(params, "name", "name_form")
        reference_number_assign(params, "at", "at_form")
        reference_number_assign(params, "ct", "ct_form")
        reference_number_assign(params, "timing", "timing_form")
        reference_number_assign(params, "mp", "mp_form")
        reference_number_assign(params, "target", "target_form")
        reference_number_assign(params, "range", "range_form")
        reference_number_assign(params, "property", "property_form")
        reference_number_assign(params, "element", "element_form")
        reference_number_assign(params, "text", "text_form")
        
    @p_name_form = params["p_name_form"]
        @skill_id_form = params["skill_id_form"]
        @name_form = params["name_form"]
        @at_form = params["at_form"]
        @ct_form = params["ct_form"]
        @timing_form = params["timing_form"]
        @mp_form = params["mp_form"]
        @target_form = params["target_form"]
        @range_form = params["range_form"]
        @property_form = params["property_form"]
        @element_form = params["element_form"]
        @text_form = params["text_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
  #    redirect_to @skill_datum, notice: 'Skill datum was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /skill_data/1
  #def update
  #  if @skill_datum.update(skill_datum_params)
  #    redirect_to @skill_datum, notice: 'Skill datum was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /skill_data/1
  #def destroy
  #  @skill_datum.destroy
  #  redirect_to skill_data_url, notice: 'Skill datum was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_datum
      @skill_datum = SkillDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_datum_params
      params.require(:skill_datum).permit(:skill_id, :name, :at, :ct, :timing, :mp, :target, :range, :property, :element, :text)
    end
end
