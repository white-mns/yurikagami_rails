class IncomesController < ApplicationController
  include MyUtility
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  # GET /incomes
  def index
    param_set
    @count	= Income.includes([:p_name]).ransack(params[:q]).result.count()
    @search	= Income.includes([:p_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @incomes	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "sub_no", "sub_no_form")
    reference_number_assign(params, "money", "money_form")
    reference_number_assign(params, "sundries", "sundries_form")
    reference_number_assign(params, "exp", "exp_form")
    reference_number_assign(params, "is_pk", "is_pk_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @money_form = params["money_form"]
    @sundries_form = params["sundries_form"]
    @exp_form = params["exp_form"]
    @is_pk_form = params["is_pk_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
    
    params[:q]["is_pk_eq_any"] = []
    if params["is_enemy"] == "on" then params[:q]["is_pk_eq_any"].push(0) end
    if params["is_practice"] == "on" then params[:q]["is_pk_eq_any"].push(1) end
    if params["is_pk"] == "on" then params[:q]["is_pk_eq_any"].push(2) end
    
    @is_pk = params["is_pk"]
    @is_enemy  = params["is_enemy"]
    @is_practice  = params["is_practice"]

    if params[:q]["is_pk_eq_any"].size == 0 then 
        @is_pk        = "on"
        @is_enemy     = "on"
        @is_practice  = "on"
    end
  end
  # GET /incomes/1
  #def show
  #end

  # GET /incomes/new
  #def new
  #  @income = Income.new
  #end

  # GET /incomes/1/edit
  #def edit
  #end

  # POST /incomes
  #def create
  #  @income = Income.new(income_params)

  #  if @income.save
  #    redirect_to @income, notice: 'Income was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /incomes/1
  #def update
  #  if @income.update(income_params)
  #    redirect_to @income, notice: 'Income was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /incomes/1
  #def destroy
  #  @income.destroy
  #  redirect_to incomes_url, notice: 'Income was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def income_params
      params.require(:income).permit(:result_no, :generate_no, :party_no, :e_no, :sub_no, :money, :sundries, :exp, :is_pk)
    end
end
