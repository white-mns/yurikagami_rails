class SearchesController < ApplicationController
  include MyUtility
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  def index
    placeholder_set
    param_set
    @count	= Search.notnil().includes(:pc_name, :status, :item).ransack(params[:q]).result.hit_count()
    @values	= Search.notnil().includes(:pc_name, :status, :item).where("value > -90000").group(:result_no,:e_no,:sub_no).ransack(params[:q]).result.sum(:value).values.sort
    @search	= Search.notnil().includes(:pc_name, :status, :item).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @searches	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "last_result_no", params_name: "last_result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "last_generate_no", params_name: "last_generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_no", params_name: "sub_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "main_no", params_name: "main_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "i_no", params_name: "i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "item_name", params_name: "i_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "value", params_name: "value_form", type: "number")

    params_to_form(params, @form_params, column_name: "status_money", params_name: "money_form", type: "number")
    
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_item", query_name:"i_no_gteq_any",  value: 0})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_item", query_name:"i_no_eq_any",    value: -1})

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
  #    redirect_to @search, notice: "Search was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /searches/1
  #def update
  #  if @search.update(search_params)
  #    redirect_to @search, notice: "Search was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /searches/1
  #def destroy
  #  @search.destroy
  #  redirect_to searches_url, notice: "Search was successfully destroyed."
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
