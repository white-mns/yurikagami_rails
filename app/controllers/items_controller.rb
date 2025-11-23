class ItemsController < ApplicationController
  include MyUtility
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    placeholder_set
    param_set
    @count	= Item.notnil().includes(:pc_name, :kind, :effect, :ability).ransack(params[:q]).result.hit_count()
    @search	= Item.notnil().includes(:pc_name, :kind, :effect, :ability).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @items	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "item_no", params_name: "item_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "name", params_name: "name_form", type: "text")
    params_to_form(params, @form_params, column_name: "kind_name", params_name: "kind_form", type: "text")
    params_to_form(params, @form_params, column_name: "effect_name", params_name: "effect_form", type: "text")
    params_to_form(params, @form_params, column_name: "effect_num", params_name: "effect_num_form", type: "number")
    params_to_form(params, @form_params, column_name: "slash", params_name: "slash_form", type: "number")
    params_to_form(params, @form_params, column_name: "charge", params_name: "charge_form", type: "number")
    params_to_form(params, @form_params, column_name: "magic", params_name: "magic_form", type: "number")
    params_to_form(params, @form_params, column_name: "guard", params_name: "guard_form", type: "number")
    params_to_form(params, @form_params, column_name: "protect", params_name: "protect_form", type: "number")
    params_to_form(params, @form_params, column_name: "have_rest", params_name: "have_rest_form", type: "number")
    params_to_form(params, @form_params, column_name: "have_max", params_name: "have_max_form", type: "number")
    params_to_form(params, @form_params, column_name: "prize", params_name: "prize_form", type: "number")
    params_to_form(params, @form_params, column_name: "ability_name", params_name: "ability_form", type: "text")
    params_to_form(params, @form_params, column_name: "equip", params_name: "equip_form", type: "number")

    checkbox_params_set_query_any(params, @form_params, query_name: "equip_eq_any",
                             checkboxes: [{params_name: "is_equiped", value: 1},
                                          {params_name: "no_equiped", value: 0}])


    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /items/1
  #def show
  #end

  # GET /items/new
  #def new
  #  @item = Item.new
  #end

  # GET /items/1/edit
  #def edit
  #end

  # POST /items
  #def create
  #  @item = Item.new(item_params)

  #  if @item.save
  #    redirect_to @item, notice: "Item was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /items/1
  #def update
  #  if @item.update(item_params)
  #    redirect_to @item, notice: "Item was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /items/1
  #def destroy
  #  @item.destroy
  #  redirect_to items_url, notice: "Item was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:result_no, :generate_no, :e_no, :sub_no, :item_no, :name, :kind_id, :effect_id, :effect_num, :slash, :charge, :magic, :guard, :protect, :have_rest, :have_max, :prize, :ability_id, :equip)
    end
end
