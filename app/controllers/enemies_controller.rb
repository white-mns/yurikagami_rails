class EnemiesController < ApplicationController
  include MyUtility
  before_action :set_enemy, only: [:show, :edit, :update, :destroy]

  # GET /enemies
  def index
    placeholder_set
    param_set
    @count	= Enemy.notnil().includes(:enemy, :suffix).ransack(params[:q]).result.hit_count()
    @search	= Enemy.notnil().includes(:enemy, :suffix).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @enemies	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "party_no", params_name: "party_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "enemy_name", params_name: "enemy_form", type: "text")
    params_to_form(params, @form_params, column_name: "suffix_name", params_name: "suffix_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /enemies/1
  #def show
  #end

  # GET /enemies/new
  #def new
  #  @enemy = Enemy.new
  #end

  # GET /enemies/1/edit
  #def edit
  #end

  # POST /enemies
  #def create
  #  @enemy = Enemy.new(enemy_params)

  #  if @enemy.save
  #    redirect_to @enemy, notice: "Enemy was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /enemies/1
  #def update
  #  if @enemy.update(enemy_params)
  #    redirect_to @enemy, notice: "Enemy was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /enemies/1
  #def destroy
  #  @enemy.destroy
  #  redirect_to enemies_url, notice: "Enemy was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enemy
      @enemy = Enemy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enemy_params
      params.require(:enemy).permit(:result_no, :generate_no, :party_no, :enemy_id, :suffix_id)
    end
end
