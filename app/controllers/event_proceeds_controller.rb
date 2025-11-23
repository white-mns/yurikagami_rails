class EventProceedsController < ApplicationController
  include MyUtility
  before_action :set_event_proceed, only: [:show, :edit, :update, :destroy]

  # GET /event_proceeds
  def index
    param_set
    @count	= EventProceed.includes([:p_name, :event_name, :last_flag_name, :flag_name]).ransack(params[:q]).result.count()
    @search	= EventProceed.includes([:p_name, :event_name, :last_flag_name, :flag_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @event_proceeds	= @search.result.per(50)
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
    reference_text_assign(params, "last_flag_name_name", "last_flag_form")
    reference_text_assign(params, "flag_name_name", "flag_form")
        
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @sub_no_form = params["sub_no_form"]
    @event_form = params["event_form"]
    @last_flag_form = params["last_flag_form"]
    @flag_form = params["flag_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
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
  #    redirect_to @event_proceed, notice: 'Event proceed was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /event_proceeds/1
  #def update
  #  if @event_proceed.update(event_proceed_params)
  #    redirect_to @event_proceed, notice: 'Event proceed was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /event_proceeds/1
  #def destroy
  #  @event_proceed.destroy
  #  redirect_to event_proceeds_url, notice: 'Event proceed was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_proceed
      @event_proceed = EventProceed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_proceed_params
      params.require(:event_proceed).permit(:result_no, :generate_no, :e_no, :sub_no, :event, :last_flag, :flag)
    end
end
