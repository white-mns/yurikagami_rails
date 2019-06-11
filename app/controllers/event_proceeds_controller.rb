class EventProceedsController < ApplicationController
  include MyUtility
  before_action :set_event_proceed, only: [:show, :edit, :update, :destroy]

  # GET /event_proceeds
  def index
    placeholder_set
    param_set
    @count	= EventProceed.notnil().includes(:pc_name).search(params[:q]).result.hit_count()
    @search	= EventProceed.notnil().includes(:pc_name).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @event_proceeds	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "sub_no", params_name: "sub_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "event_name", params_name: "event_form", type: "text")
    params_to_form(params, @form_params, column_name: "last_flag_name", params_name: "last_flag_form", type: "text")
    params_to_form(params, @form_params, column_name: "flag_name", params_name: "flag_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /event_proceeds/1
  #def show
  #end

  # GET /event_proceeds/new
  #def new
  #  @event_proceed = EventProceed.new
  #end

  # GET /event_proceeds/1/edit
  #def edit
  #end

  # POST /event_proceeds
  #def create
  #  @event_proceed = EventProceed.new(event_proceed_params)

  #  if @event_proceed.save
  #    redirect_to @event_proceed, notice: "Event proceed was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /event_proceeds/1
  #def update
  #  if @event_proceed.update(event_proceed_params)
  #    redirect_to @event_proceed, notice: "Event proceed was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /event_proceeds/1
  #def destroy
  #  @event_proceed.destroy
  #  redirect_to event_proceeds_url, notice: "Event proceed was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_proceed
      @event_proceed = EventProceed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_proceed_params
      params.require(:event_proceed).permit(:result_no, :generate_no, :e_no, :sub_no, :event_id, :last_flag_id, :flag_id)
    end
end
