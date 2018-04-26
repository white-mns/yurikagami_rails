class ItemGetsController < ApplicationController
  include MyUtility
  before_action :set_item_get, only: [:show, :edit, :update, :destroy]

  # GET /item_gets
  def index
    param_set
    @count	= ItemGet.includes([:p_name, :enemy_name, :item_data, current_place: :place_name]).search(params[:q]).result.count()
    @search	= ItemGet.includes([:p_name, :enemy_name, :item_data, current_place: :place_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @item_gets	= @search.result.per(50)
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
    reference_text_assign(params, "enemy_name_name", "enemy_form")
    reference_text_assign(params, "item", "item_form")
    reference_number_assign(params, "is_pk", "is_pk_form")
    reference_number_assign(params, "item_data_prize", "prize_form")
    reference_text_assign(params, "current_place_place_name_name", "place_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @enemy_form = params["enemy_form"]
    @item_form = params["item_form"]
    @is_pk_form = params["is_pk_form"]
    @prize_form = params["prize_form"]
    @place_form = params["place_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
    
    params[:q]["is_pk_eq_any"] = []
    if params["is_pk"] == "on" then params[:q]["is_pk_eq_any"].push(1) end
    if params["no_pk"] == "on" then params[:q]["is_pk_eq_any"].push(0) end
    @is_pk = params["is_pk"]
    @no_pk  = params["no_pk"]
    if params[:q]["is_pk_eq_any"].size == 0 then 
        @is_pk = "on"
        @no_pk  = "on"
    end

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
  #    redirect_to @item_get, notice: 'Item get was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /item_gets/1
  #def update
  #  if @item_get.update(item_get_params)
  #    redirect_to @item_get, notice: 'Item get was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /item_gets/1
  #def destroy
  #  @item_get.destroy
  #  redirect_to item_gets_url, notice: 'Item get was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_get
      @item_get = ItemGet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_get_params
      params.require(:item_get).permit(:result_no, :generate_no, :party_no, :e_no, :sub_no, :enemy, :item, :is_pk)
    end
end
