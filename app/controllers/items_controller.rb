class ItemsController < ApplicationController
  include MyUtility
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    param_set
    @count	= Item.includes([:p_name, :kind_name, :effect_name, :ability_name]).search(params[:q]).result.count()
    @search	= Item.includes([:p_name, :kind_name, :effect_name, :ability_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @items	= @search.result.per(50)
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
    reference_number_assign(params, "item_no", "item_no_form")
    reference_number_assign(params, "name", "name_form")
    reference_text_assign(params, "kind_name_name", "kind_form")
    reference_text_assign(params, "effect_name_name", "effect_form")
    reference_number_assign(params, "effect_num", "effect_num_form")
    reference_number_assign(params, "slash", "slash_form")
    reference_number_assign(params, "charge", "charge_form")
    reference_number_assign(params, "magic", "magic_form")
    reference_number_assign(params, "guard", "guard_form")
    reference_number_assign(params, "protect", "protect_form")
    reference_number_assign(params, "have_rest", "have_rest_form")
    reference_number_assign(params, "have_max", "have_max_form")
    reference_number_assign(params, "prize", "prize_form")
    reference_text_assign(params, "ability_name_name", "ability_form")
    reference_number_assign(params, "equip", "equip_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @item_no_form = params["item_no_form"]
    @name_form = params["name_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @effect_num_form = params["effect_num_form"]
    @slash_form = params["slash_form"]
    @charge_form = params["charge_form"]
    @magic_form = params["magic_form"]
    @guard_form = params["guard_form"]
    @protect_form = params["protect_form"]
    @have_rest_form = params["have_rest_form"]
    @have_max_form = params["have_max_form"]
    @prize_form = params["prize_form"]
    @ability_form = params["ability_form"]
    @equip_form = params["equip_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
    
    params[:q]["equip_eq_any"] = []
    if params["is_equiped"] == "on" then params[:q]["equip_eq_any"].push(1) end
    if params["no_equiped"] == "on" then params[:q]["equip_eq_any"].push(0) end
    @is_equiped = params["is_equiped"]
    @no_equiped  = params["no_equiped"]
    if params[:q]["equip_eq_any"].size == 0 then 
        @is_equiped = "on"
        @no_equiped  = "on"
    end
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
  #    redirect_to @item, notice: 'Item was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /items/1
  #def update
  #  if @item.update(item_params)
  #    redirect_to @item, notice: 'Item was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /items/1
  #def destroy
  #  @item.destroy
  #  redirect_to items_url, notice: 'Item was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:result_no, :generate_no, :e_no, :sub_no, :item_no, :name, :kind, :effect, :effect_num, :slash, :charge, :magic, :guard, :protect, :have_rest, :have_max, :prize, :ability, :equip)
    end
end
