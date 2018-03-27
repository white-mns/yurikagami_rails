class NewEventsController < ApplicationController
  include MyUtility
  before_action :set_new_event, only: [:show, :edit, :update, :destroy]

  # GET /new_events
  def index
    param_set
    @count	= NewEvent.includes([:event_name, :flag_name]).search(params[:q]).result.count()
    @search	= NewEvent.includes([:event_name, :flag_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_events	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_text_assign(params, "event_name_name", "event_form")
    reference_text_assign(params, "flag_name_name", "flag_form")
        
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @event_form = params["event_form"]
    @flag_form = params["flag_form"]
  end
  # GET /new_events/1
  #def show
  #end

  # GET /new_events/new
  #def new
  #  @new_event = NewEvent.new
  #end

  # GET /new_events/1/edit
  #def edit
  #end

  # POST /new_events
  #def create
  #  @new_event = NewEvent.new(new_event_params)

  #  if @new_event.save
  #    redirect_to @new_event, notice: 'New event was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /new_events/1
  #def update
  #  if @new_event.update(new_event_params)
  #    redirect_to @new_event, notice: 'New event was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /new_events/1
  #def destroy
  #  @new_event.destroy
  #  redirect_to new_events_url, notice: 'New event was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_event
      @new_event = NewEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_event_params
      params.require(:new_event).permit(:result_no, :generate_no, :event, :flag)
    end
end
