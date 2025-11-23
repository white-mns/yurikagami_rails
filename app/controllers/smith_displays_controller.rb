class SmithDisplaysController < ApplicationController
  include MyUtility
  before_action :set_smith_display, only: [:show, :edit, :update, :destroy]

  # GET /smith_displays
  def index
    param_set
    @count	= SmithDisplay.includes(:p_name).ransack(params[:q]).result.count()
    @search	= SmithDisplay.includes(:p_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @smith_displays	= @search.result.per(50)
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
    reference_number_assign(params, "total_price", "total_price_form")
    reference_number_assign(params, "price_rate", "price_rate_form")
    reference_number_assign(params, "display_rate", "display_rate_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @total_price_form = params["total_price_form"]
    @price_rate_form = params["price_rate_form"]
    @display_rate_form = params["display_rate_form"]
  end
  # GET /smith_displays/1
  #def show
  #end

  # GET /smith_displays/new
  #def new
  #  @smith_display = SmithDisplay.new
  #end

  # GET /smith_displays/1/edit
  #def edit
  #end

  # POST /smith_displays
  #def create
  #  @smith_display = SmithDisplay.new(smith_display_params)

  #  if @smith_display.save
  #    redirect_to @smith_display, notice: 'Smith display was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /smith_displays/1
  #def update
  #  if @smith_display.update(smith_display_params)
  #    redirect_to @smith_display, notice: 'Smith display was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /smith_displays/1
  #def destroy
  #  @smith_display.destroy
  #  redirect_to smith_displays_url, notice: 'Smith display was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smith_display
      @smith_display = SmithDisplay.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def smith_display_params
      params.require(:smith_display).permit(:result_no, :generate_no, :party_no, :e_no, :sub_no, :total_price, :price_rate, :display_rate)
    end
end
