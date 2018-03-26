class EventsController < ApplicationController
  include MyUtility
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    param_set
    @count	= Event.includes([:p_name, :event_name, :flag_name, :text_name]).search(params[:q]).result.count()
    @search	= Event.includes([:p_name, :event_name, :flag_name, :text_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @events	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "sub_no", "sub_no_form")
    reference_text_assign(params, "event_name_name", "event_form")
    reference_text_assign(params, "flag_name_name", "flag_form")
    reference_text_assign(params, "text_name_name", "text_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @event_form = params["event_form"]
    @flag_form = params["flag_form"]
    @text_form = params["text_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
  #    redirect_to @event, notice: 'Event was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /events/1
  #def update
  #  if @event.update(event_params)
  #    redirect_to @event, notice: 'Event was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /events/1
  #def destroy
  #  @event.destroy
  #  redirect_to events_url, notice: 'Event was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:result_no, :generate_no, :e_no, :sub_no, :event, :flag, :text)
    end
end
