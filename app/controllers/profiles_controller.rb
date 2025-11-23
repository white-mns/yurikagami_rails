class ProfilesController < ApplicationController
  include MyUtility
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  def index
    param_set
    @count	= Profile.includes([:p_name, :tribe_name]).ransack(params[:q]).result.count()
    @search	= Profile.includes([:p_name, :tribe_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @profiles	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "sub_no", "sub_no_form")
    reference_text_assign(params, "nickname", "nickname_form")
    reference_text_assign(params, "title", "title_form")
    reference_text_assign(params, "job", "job_form")
    reference_text_assign(params, "sex", "sex_form")
    reference_text_assign(params, "age", "age_form")
    reference_text_assign(params, "height", "height_form")
    reference_text_assign(params, "weight", "weight_form")
    
            
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @p_name_form = params["p_name_form"]
    @sub_no_form = params["sub_no_form"]
    @nickname_form = params["nickname_form"]
    @title_form = params["title_form"]
    @job_form = params["job_form"]
    @sex_form = params["sex_form"]
    @age_form = params["age_form"]
    @height_form = params["height_form"]
    @weight_form = params["weight_form"]
 
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
  end
  # GET /profiles/1
  #def show
  #end

  # GET /profiles/new
  #def new
  #  @profile = Profile.new
  #end

  # GET /profiles/1/edit
  #def edit
  #end

  # POST /profiles
  #def create
  #  @profile = Profile.new(profile_params)

  #  if @profile.save
  #    redirect_to @profile, notice: 'Profile was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /profiles/1
  #def update
  #  if @profile.update(profile_params)
  #    redirect_to @profile, notice: 'Profile was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /profiles/1
  #def destroy
  #  @profile.destroy
  #  redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:result_no, :generate_no, :e_no, :sub_no, :nickname, :title, :job, :sex, :age, :height, :weight)
    end
end
