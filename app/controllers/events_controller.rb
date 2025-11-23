class EventsController < ApplicationController
  include MyUtility
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    placeholder_set
    param_set
    @count	= Event.notnil().includes(:pc_name, :event, :flag, :text).ransack(params[:q]).result.hit_count()
    @search	= Event.notnil().includes(:pc_name, :event, :flag, :text).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @events	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "flag_name", params_name: "flag_form", type: "text")
    params_to_form(params, @form_params, column_name: "text_name", params_name: "text_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /events/1
  #def show
  #end

  # GET /events/new
  #def new
  #  @event = Event.new
  #end

  # GET /events/1/edit
  #def edit
  #end

  # POST /events
  #def create
  #  @event = Event.new(event_params)

  #  if @event.save
  #    redirect_to @event, notice: "Event was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /events/1
  #def update
  #  if @event.update(event_params)
  #    redirect_to @event, notice: "Event was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /events/1
  #def destroy
  #  @event.destroy
  #  redirect_to events_url, notice: "Event was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:result_no, :generate_no, :e_no, :sub_no, :event_id, :flag_id, :text_id)
    end
end
