class ItemGetsController < ApplicationController
  include MyUtility
  before_action :set_item_get, only: [:show, :edit, :update, :destroy]

  # GET /item_gets
  def index
    placeholder_set
    param_set
    @count	= ItemGet.notnil().includes(:pc_name, :enemy, :item, :item_data, [current_place: :place]).search(params[:q]).result.hit_count()
    @search	= ItemGet.notnil().includes(:pc_name, :enemy, :item, :item_data, [current_place: :place]).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @item_gets	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_no", params_name: "sub_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "enemy_name", params_name: "enemy_form", type: "text")
    params_to_form(params, @form_params, column_name: "item_name", params_name: "item_form", type: "text")
    params_to_form(params, @form_params, column_name: "i_no", params_name: "i_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_pk", params_name: "is_pk_form", type: "number")

    params_to_form(params, @form_params, column_name: "item_data_prize", params_name: "prize_form", type: "number")
    params_to_form(params, @form_params, column_name: "current_place_place_name", params_name: "place_form", type: "text")
    reference_number_assign(params, "item_data_prize", "prize_form")

    checkbox_params_set_query_any(params, @form_params, query_name: "is_pk_eq_any",
                             checkboxes: [{params_name: "no_pk", value: 0, first_checked: true},
                                          {params_name: "is_pk", value: 1, first_checked: true}])

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /item_gets/1
  #def show
  #end

  # GET /item_gets/new
  #def new
  #  @item_get = ItemGet.new
  #end

  # GET /item_gets/1/edit
  #def edit
  #end

  # POST /item_gets
  #def create
  #  @item_get = ItemGet.new(item_get_params)

  #  if @item_get.save
  #    redirect_to @item_get, notice: "Item get was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /item_gets/1
  #def update
  #  if @item_get.update(item_get_params)
  #    redirect_to @item_get, notice: "Item get was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /item_gets/1
  #def destroy
  #  @item_get.destroy
  #  redirect_to item_gets_url, notice: "Item get was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_get
      @item_get = ItemGet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_get_params
      params.require(:item_get).permit(:result_no, :generate_no, :party_no, :e_no, :sub_no, :enemy_id, :item_id, :i_no, :is_pk)
    end
end
