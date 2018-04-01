class CurrentPlacesController < ApplicationController
  include MyUtility
  before_action :set_current_place, only: [:show, :edit, :update, :destroy]

  # GET /current_places
  def index
    param_set
    @count	= CurrentPlace.includes([:p_name]).search(params[:q]).result.count()
    @search	= CurrentPlace.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @current_places	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "result_no", "result_no_form")
        reference_number_assign(params, "generate_no", "generate_no_form")
        reference_number_assign(params, "party_no", "party_no_form")
        reference_number_assign(params, "place", "place_form")
        reference_number_assign(params, "shop", "shop_form")
        reference_number_assign(params, "inn", "inn_form")
        
    @p_name_form = params["p_name_form"]
        @result_no_form = params["result_no_form"]
        @generate_no_form = params["generate_no_form"]
        @party_no_form = params["party_no_form"]
        @place_form = params["place_form"]
        @shop_form = params["shop_form"]
        @inn_form = params["inn_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
  end
  # GET /current_places/1
  #def show
  #end

  # GET /current_places/new
  #def new
  #  @current_place = CurrentPlace.new
  #end

  # GET /current_places/1/edit
  #def edit
  #end

  # POST /current_places
  #def create
  #  @current_place = CurrentPlace.new(current_place_params)

  #  if @current_place.save
  #    redirect_to @current_place, notice: 'Current place was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /current_places/1
  #def update
  #  if @current_place.update(current_place_params)
  #    redirect_to @current_place, notice: 'Current place was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /current_places/1
  #def destroy
  #  @current_place.destroy
  #  redirect_to current_places_url, notice: 'Current place was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_place
      @current_place = CurrentPlace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def current_place_params
      params.require(:current_place).permit(:result_no, :generate_no, :party_no, :place, :shop, :inn)
    end
end
