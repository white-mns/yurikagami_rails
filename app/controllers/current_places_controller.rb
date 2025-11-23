class CurrentPlacesController < ApplicationController
  include MyUtility
  before_action :set_current_place, only: [:show, :edit, :update, :destroy]

  # GET /current_places
  def index
    placeholder_set
    param_set
    @count	= CurrentPlace.notnil().includes(:place, party_info: [party_members: :pc_name]).ransack(params[:q]).result.hit_count()
    @search	= CurrentPlace.notnil().includes(:place, party_info: [party_members: :pc_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @current_places	= @search.result.per(50)
  end

  # GET /current_place/start
  def start_graph
    index
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        if action_name == "start_graph" then
            params["result_no_form"] ||= "1~" + sprintf("%d",@latest_result)
        end
        params["result_no_form"] ||= sprintf("%d",@latest_result)
    end

    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "place_name", params_name: "place_form", type: "text")
    params_to_form(params, @form_params, column_name: "shop", params_name: "shop_form", type: "number")
    params_to_form(params, @form_params, column_name: "inn", params_name: "inn_form", type: "number")
    
    params_to_form(params, @form_params, column_name: "party_info_party_members_pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "party_info_party_members_e_no", params_name: "e_no_form", type: "text")
    params_to_form(params, @form_params, column_name: "party_info_name", params_name: "name_form", type: "text")

    checkbox_params_set_query_any(params, @form_params, query_name: "inn_eq_any",
                             checkboxes: [{params_name: "is_inn", value: 1},
                                          {params_name: "no_inn", value: 0}])
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
  #    redirect_to @current_place, notice: "Current place was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /current_places/1
  #def update
  #  if @current_place.update(current_place_params)
  #    redirect_to @current_place, notice: "Current place was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /current_places/1
  #def destroy
  #  @current_place.destroy
  #  redirect_to current_places_url, notice: "Current place was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_place
      @current_place = CurrentPlace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def current_place_params
      params.require(:current_place).permit(:result_no, :generate_no, :party_no, :place_id, :shop, :inn)
    end
end
