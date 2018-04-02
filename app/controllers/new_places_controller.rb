class NewPlacesController < ApplicationController
  include MyUtility
  before_action :set_new_place, only: [:show, :edit, :update, :destroy]

  # GET /new_places
  def index
    param_set
    @count	= NewPlace.includes([:p_name]).search(params[:q]).result.count()
    @search	= NewPlace.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_places	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "result_no", "result_no_form")
        reference_number_assign(params, "generate_no", "generate_no_form")
        reference_number_assign(params, "place", "place_form")
        
    @p_name_form = params["p_name_form"]
        @result_no_form = params["result_no_form"]
        @generate_no_form = params["generate_no_form"]
        @place_form = params["place_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
  #    redirect_to @new_place, notice: 'New place was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /new_places/1
  #def update
  #  if @new_place.update(new_place_params)
  #    redirect_to @new_place, notice: 'New place was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /new_places/1
  #def destroy
  #  @new_place.destroy
  #  redirect_to new_places_url, notice: 'New place was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_place
      @new_place = NewPlace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_place_params
      params.require(:new_place).permit(:result_no, :generate_no, :place)
    end
end
