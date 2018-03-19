class JobNamesController < ApplicationController
  include MyUtility
  before_action :set_job_name, only: [:show, :edit, :update, :destroy]

  # GET /job_names
  def index
    param_set
    @count	= JobName.includes([:p_name]).search(params[:q]).result.count()
    @search	= JobName.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @job_names	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "job_id", "job_id_form")
        reference_number_assign(params, "name", "name_form")
        
    @p_name_form = params["p_name_form"]
        @job_id_form = params["job_id_form"]
        @name_form = params["name_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
  end
  # GET /job_names/1
  #def show
  #end

  # GET /job_names/new
  #def new
  #  @job_name = JobName.new
  #end

  # GET /job_names/1/edit
  #def edit
  #end

  # POST /job_names
  #def create
  #  @job_name = JobName.new(job_name_params)

  #  if @job_name.save
  #    redirect_to @job_name, notice: 'Job name was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /job_names/1
  #def update
  #  if @job_name.update(job_name_params)
  #    redirect_to @job_name, notice: 'Job name was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /job_names/1
  #def destroy
  #  @job_name.destroy
  #  redirect_to job_names_url, notice: 'Job name was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_name
      @job_name = JobName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_name_params
      params.require(:job_name).permit(:job_id, :name)
    end
end
