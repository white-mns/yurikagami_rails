class StatusesController < ApplicationController
  include MyUtility
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  def index
    placeholder_set
    param_set
    @count	= Status.notnil().includes(:pc_name, :job1, :job2, :tribe).search(params[:q]).result.hit_count()
    @search	= Status.notnil().includes(:pc_name, :job1, :job2, :tribe).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @statuses	= @search.result.per(50)
  end

  # GET /statuses
  def graph
    index
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
    params_to_form(params, @form_params, column_name: "lv", params_name: "lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "exp", params_name: "exp_form", type: "number")
    params_to_form(params, @form_params, column_name: "mexp", params_name: "mexp_form", type: "number")
    params_to_form(params, @form_params, column_name: "job1_name", params_name: "job1_form", type: "text")
    params_to_form(params, @form_params, column_name: "job2_name", params_name: "job2_form", type: "text")
    params_to_form(params, @form_params, column_name: "hp", params_name: "hp_form", type: "number")
    params_to_form(params, @form_params, column_name: "mhp", params_name: "mhp_form", type: "number")
    params_to_form(params, @form_params, column_name: "hp_rate", params_name: "hp_rate_form", type: "number")
    params_to_form(params, @form_params, column_name: "mp", params_name: "mp_form", type: "number")
    params_to_form(params, @form_params, column_name: "mmp", params_name: "mmp_form", type: "number")
    params_to_form(params, @form_params, column_name: "mp_rate", params_name: "mp_rate_form", type: "number")
    params_to_form(params, @form_params, column_name: "sp", params_name: "sp_form", type: "number")
    params_to_form(params, @form_params, column_name: "str", params_name: "str_form", type: "number")
    params_to_form(params, @form_params, column_name: "int", params_name: "int_form", type: "number")
    params_to_form(params, @form_params, column_name: "tec", params_name: "tec_form", type: "number")
    params_to_form(params, @form_params, column_name: "agi", params_name: "agi_form", type: "number")
    params_to_form(params, @form_params, column_name: "def", params_name: "def_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill", params_name: "skill_form", type: "number")
    params_to_form(params, @form_params, column_name: "personality_name", params_name: "personality_form", type: "text")
    params_to_form(params, @form_params, column_name: "tribe_name", params_name: "tribe_form", type: "text")
    params_to_form(params, @form_params, column_name: "money", params_name: "money_form", type: "number")
    params_to_form(params, @form_params, column_name: "sundries", params_name: "sundries_form", type: "number")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
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
  #    redirect_to @status, notice: "Status was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /statuses/1
  #def update
  #  if @status.update(status_params)
  #    redirect_to @status, notice: "Status was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /statuses/1
  #def destroy
  #  @status.destroy
  #  redirect_to statuses_url, notice: "Status was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:result_no, :generate_no, :e_no, :sub_no, :lv, :exp, :mexp, :job1_id, :job2_id, :hp, :mhp, :hp_rate, :mp, :mmp, :mp_rate, :sp, :str, :int, :tec, :agi, :def, :skill, :personality, :tribe_id, :money, :sundries)
    end
end
