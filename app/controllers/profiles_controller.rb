class ProfilesController < ApplicationController
  include MyUtility
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  def index
    placeholder_set
    param_set
    @count	= Profile.notnil().includes(:pc_name).search(params[:q]).result.hit_count()
    @search	= Profile.notnil().includes(:pc_name).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @profiles	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "nickname", params_name: "nickname_form", type: "number")
    params_to_form(params, @form_params, column_name: "title", params_name: "title_form", type: "number")
    params_to_form(params, @form_params, column_name: "job", params_name: "job_form", type: "number")
    params_to_form(params, @form_params, column_name: "sex", params_name: "sex_form", type: "number")
    params_to_form(params, @form_params, column_name: "age", params_name: "age_form", type: "number")
    params_to_form(params, @form_params, column_name: "height", params_name: "height_form", type: "number")
    params_to_form(params, @form_params, column_name: "weight", params_name: "weight_form", type: "number")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
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
  #    redirect_to @profile, notice: "Profile was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /profiles/1
  #def update
  #  if @profile.update(profile_params)
  #    redirect_to @profile, notice: "Profile was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /profiles/1
  #def destroy
  #  @profile.destroy
  #  redirect_to profiles_url, notice: "Profile was successfully destroyed."
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
