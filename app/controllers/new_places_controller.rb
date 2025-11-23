class NewPlacesController < ApplicationController
  include MyUtility
  before_action :set_new_place, only: [:show, :edit, :update, :destroy]

  # GET /new_places
  def index
    placeholder_set
    param_set
    @count	= NewPlace.notnil().includes(:place).ransack(params[:q]).result.hit_count()
    @search	= NewPlace.notnil().includes(:place).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @new_places	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "place_name", params_name: "place_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /new_places/1
  #def show
  #end

  # GET /new_places/new
  #def new
  #  @new_place = NewPlace.new
  #end

  # GET /new_places/1/edit
  #def edit
  #end

  # POST /new_places
  #def create
  #  @new_place = NewPlace.new(new_place_params)

  #  if @new_place.save
  #    redirect_to @new_place, notice: "New place was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /new_places/1
  #def update
  #  if @new_place.update(new_place_params)
  #    redirect_to @new_place, notice: "New place was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /new_places/1
  #def destroy
  #  @new_place.destroy
  #  redirect_to new_places_url, notice: "New place was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_place
      @new_place = NewPlace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_place_params
      params.require(:new_place).permit(:result_no, :generate_no, :place_id)
    end
end
