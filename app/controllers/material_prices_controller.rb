class MaterialPricesController < ApplicationController
  include MyUtility
  before_action :set_material_price, only: [:show, :edit, :update, :destroy]

  # GET /material_prices
  def index
    param_set
    @count	= MaterialPrice.search(params[:q]).result.count()
    @search	= MaterialPrice.page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @material_prices	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "name", "name_form")
    reference_number_assign(params, "price", "price_form")
    reference_number_assign(params, "performance", "performance_form")
    reference_number_assign(params, "is_sub", "is_sub_form")
        
    @name_form = params["name_form"]
    @price_form = params["price_form"]
    @performance_form = params["performance_form"]
    @is_sub_form = params["is_sub_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
  end
  # GET /material_prices/1
  #def show
  #end

  # GET /material_prices/new
  #def new
  #  @material_price = MaterialPrice.new
  #end

  # GET /material_prices/1/edit
  #def edit
  #end

  # POST /material_prices
  #def create
  #  @material_price = MaterialPrice.new(material_price_params)

  #  if @material_price.save
  #    redirect_to @material_price, notice: 'Material price was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /material_prices/1
  #def update
  #  if @material_price.update(material_price_params)
  #    redirect_to @material_price, notice: 'Material price was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /material_prices/1
  #def destroy
  #  @material_price.destroy
  #  redirect_to material_prices_url, notice: 'Material price was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_price
      @material_price = MaterialPrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def material_price_params
      params.require(:material_price).permit(:name, :price, :performance, :is_sub)
    end
end
