class StatusesController < ApplicationController
  include MyUtility
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  def index
    param_set
    @count	= Status.includes([:p_name, :tribe_name, :job1_name, :job2_name]).ransack(params[:q]).result.count()
    @search	= Status.includes([:p_name, :tribe_name, :job1_name, :job2_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @statuses	= @search.result.per(50)
  end

  # GET /statuses
  def graph
    param_set
    @count	= Status.includes([:p_name, :tribe_name, :job1_name, :job2_name]).ransack(params[:q]).result.count()
    @search = Status.includes([:p_name, :tribe_name, :job1_name, :job2_name]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @statuses	= @search.result
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
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "exp", "exp_form")
    reference_number_assign(params, "mexp", "mexp_form")
    reference_text_assign(params, "job1_name_name", "job1_form")
    reference_text_assign(params, "job2_name_name", "job2_form")
    reference_number_assign(params, "hp", "hp_form")
    reference_number_assign(params, "mhp", "mhp_form")
    reference_number_assign(params, "hp_rate", "hp_rate_form")
    reference_number_assign(params, "mp", "mp_form")
    reference_number_assign(params, "mmp", "mmp_form")
    reference_number_assign(params, "mp_rate", "mp_rate_form")
    reference_number_assign(params, "sp", "sp_form")
    reference_number_assign(params, "str", "str_form")
    reference_number_assign(params, "int", "int_form")
    reference_number_assign(params, "tec", "tec_form")
    reference_number_assign(params, "agi", "agi_form")
    reference_number_assign(params, "def", "def_form")
    reference_number_assign(params, "skill", "skill_form")
    reference_number_assign(params, "personality", "personality_form")
    reference_text_assign(params, "tribe_name_name", "tribe_form")
    reference_number_assign(params, "money", "money_form")
    reference_number_assign(params, "sundries", "sundries_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @lv_form = params["lv_form"]
    @exp_form = params["exp_form"]
    @mexp_form = params["mexp_form"]
    @job1_form = params["job1_form"]
    @job2_form = params["job2_form"]
    @hp_form = params["hp_form"]
    @mhp_form = params["mhp_form"]
    @hp_rate_form = params["hp_rate_form"]
    @mp_form = params["mp_form"]
    @mmp_form = params["mmp_form"]
    @mp_rate_form = params["mp_rate_form"]
    @sp_form = params["sp_form"]
    @str_form = params["str_form"]
    @int_form = params["int_form"]
    @tec_form = params["tec_form"]
    @agi_form = params["agi_form"]
    @def_form = params["def_form"]
    @skill_form = params["skill_form"]
    @personality_form = params["personality_form"]
    @tribe_form = params["tribe_form"]
    @money_form = params["money_form"]
    @sundries_form = params["sundries_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
  end
  # GET /statuses/1
  #def show
  #end

  # GET /statuses/new
  #def new
  #  @status = Status.new
  #end

  # GET /statuses/1/edit
  #def edit
  #end

  # POST /statuses
  #def create
  #  @status = Status.new(status_params)

  #  if @status.save
  #    redirect_to @status, notice: 'Status was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /statuses/1
  #def update
  #  if @status.update(status_params)
  #    redirect_to @status, notice: 'Status was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /statuses/1
  #def destroy
  #  @status.destroy
  #  redirect_to statuses_url, notice: 'Status was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:result_no, :generate_no, :e_no, :sub_no, :lv, :exp, :mexp, :job1, :job2, :hp, :mhp, :hp_rate, :mp, :mmp, :mp_rate, :sp, :str, :int, :tec, :agi, :def, :skill, :personality, :tribe, :money, :sundries)
    end
end
