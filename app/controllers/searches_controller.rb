class SearchesController < ApplicationController
  include MyUtility
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  def index
    param_set
    @count	= Search.includes(:p_name, :status, :item).ransack(params[:q]).result.count()
    @values	= Search.includes(:p_name, :status, :item).where("value > -90000").group(:result_no,:e_no,:sub_no).ransack(params[:q]).result.sum(:value).values.sort
    @search	= Search.includes(:p_name, :status, :item).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @searches	= @search.result.per(50)
  end

  def graph
    param_set
    @count	= Search.includes(:p_name, :status, :item).ransack(params[:q]).result.count()
    @values	      = Search.includes(:p_name, :status, :item).where("value > -90000").group(:result_no,:e_no,:sub_no).ransack(params[:q]).result.sum(:value).values.sort
    @graph_values = Search.includes(:p_name, :status, :item).where("value > -90000").group(:result_no,:e_no,:sub_no).ransack(params[:q]).result.maximum(:value).values.sort
    @search	= Search.includes(:p_name, :status, :item).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @searches	= @search.result.per(50)
  end
  
  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "last_result_no", "last_result_no_form")
    reference_number_assign(params, "last_generate_no", "last_generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "sub_no", "sub_no_form")
    reference_number_assign(params, "main_no", "main_no_form")
    reference_number_assign(params, "i_no", "i_no_form")
    reference_text_assign(params, "item_name", "i_name_form")
    reference_number_assign(params, "value", "value_form")
    reference_number_assign(params, "status_money", "money_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @last_result_no_form = params["last_result_no_form"]
    @last_generate_no_form = params["last_generate_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @main_no_form = params["main_no_form"]
    @i_no_form = params["i_no_form"]
    @i_name_form = params["i_name_form"]
    @value_form = params["value_form"]
    @money_form = params["money_form"]

    params[:q]["i_no_eq_any"] = []
    params[:q]["i_no_gteq_any"] = []
    if params["is_item"] == "on" then params[:q]["i_no_gteq_any"].push(0) end
    if params["no_item"] == "on" then params[:q]["i_no_eq_any"].push(-1) end
    @is_item = params["is_item"]
    @no_item  = params["no_item"]
    if params[:q]["i_no_eq_any"].size != 0 && params[:q]["i_no_gteq_any"].size != 0 then 
        params[:q]["i_no_eq_any"] = []
        params[:q]["i_no_gteq_any"] = []
    end
  end
  # GET /searches/1
  #def show
  #end

  # GET /searches/new
  #def new
  #  @search = Search.new
  #end

  # GET /searches/1/edit
  #def edit
  #end

  # POST /searches
  #def create
  #  @search = Search.new(search_params)

  #  if @search.save
  #    redirect_to @search, notice: 'Search was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /searches/1
  #def update
  #  if @search.update(search_params)
  #    redirect_to @search, notice: 'Search was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /searches/1
  #def destroy
  #  @search.destroy
  #  redirect_to searches_url, notice: 'Search was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def search_params
      params.require(:search).permit(:result_no, :generate_no, :last_result_no, :last_generate_no, :e_no, :sub_no, :main_no, :i_no, :i_name, :value)
    end
end
