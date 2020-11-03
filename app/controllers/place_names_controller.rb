class PlaceNamesController < ApplicationController
  include MyUtility
  before_action :set_place_name, only: [:show, :edit, :update, :destroy]

  # GET /place_names
  def index
    param_set
    @count	= PlaceName.search(params[:q]).result.count()
    @search	= PlaceName.page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @place_names	= @search.result.per(50)
  end

  def param_set
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "place_id", "place_id_form")
    reference_text_assign(params, "name", "name_form")
    
    @place_id_form = params["place_id_form"]
    @name_form = params["name_form"]
  end
  # GET /place_names/1
  #def show
  #end

  # GET /place_names/new
  #def new
  #  @place_name = PlaceName.new
  #end

  # GET /place_names/1/edit
  #def edit
  #end

  # POST /place_names
  #def create
  #  @place_name = PlaceName.new(place_name_params)

  #  if @place_name.save
  #    redirect_to @place_name, notice: 'Place name was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /place_names/1
  #def update
  #  if @place_name.update(place_name_params)
  #    redirect_to @place_name, notice: 'Place name was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /place_names/1
  #def destroy
  #  @place_name.destroy
  #  redirect_to place_names_url, notice: 'Place name was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_name
      @place_name = PlaceName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_name_params
      params.require(:place_name).permit(:place_id, :name)
    end
end