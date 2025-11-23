class CurrentPlacesController < ApplicationController
  include MyUtility
  before_action :set_current_place, only: [:show, :edit, :update, :destroy]

  # GET /current_places
  def index
    param_set
    @count	= CurrentPlace.includes(:place_name, party_info: [party_members: :p_name]).ransack(params[:q]).result.count()
    @search	= CurrentPlace.includes(:place_name, party_info: [party_members: :p_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @current_places	= @search.result.per(50)
  end

  # GET /current_place/start
  def start_graph
    index
  end

  def param_set
    @last_result = Name.maximum('result_no')
    if action_name == "start_graph" then
        params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : "1~" + sprintf('%d',@last_result)
    else
        params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    end
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_text_assign(params, "place_name_name", "place_form")
    reference_number_assign(params, "shop", "shop_form")
    reference_number_assign(params, "inn", "inn_form")
    reference_text_assign(params, "party_info_party_members_p_name_name", "p_name_form")
    reference_text_assign(params, "party_info_name", "name_form")
    reference_number_assign(params, "party_info_party_members_e_no", "e_no_form")
        
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @place_form = params["place_form"]
    @shop_form = params["shop_form"]
    @inn_form = params["inn_form"]
    @p_name_form = params["p_name_form"]
    @party_name_form = params["party_name_form"]
    @e_no_form = params["e_no_form"]
    
    params[:q]["inn_eq_any"] = []
    if params["is_inn"] == "on" then params[:q]["inn_eq_any"].push(1) end
    if params["no_inn"] == "on" then params[:q]["inn_eq_any"].push(0) end
    @is_inn = params["is_inn"]
    @no_inn  = params["no_inn"]
    if params[:q]["inn_eq_any"].size == 0 then 
        @is_inn = "on"
        @no_inn  = "on"
    end
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
