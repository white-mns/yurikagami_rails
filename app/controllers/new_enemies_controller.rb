class NewEnemiesController < ApplicationController
  include MyUtility
  before_action :set_new_enemy, only: [:show, :edit, :update, :destroy]

  # GET /new_enemies
  def index
    placeholder_set
    param_set
    @count	= NewEnemy.notnil().includes(:enemy).ransack(params[:q]).result.hit_count()
    @search	= NewEnemy.notnil().includes(:enemy).page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @new_enemies	= @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "enemy_name", params_name: "enemy_form", type: "number")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /new_enemies/1
  #def show
  #end

  # GET /new_enemies/new
  #def new
  #  @new_enemy = NewEnemy.new
  #end

  # GET /new_enemies/1/edit
  #def edit
  #end

  # POST /new_enemies
  #def create
  #  @new_enemy = NewEnemy.new(new_enemy_params)

  #  if @new_enemy.save
  #    redirect_to @new_enemy, notice: "New enemy was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /new_enemies/1
  #def update
  #  if @new_enemy.update(new_enemy_params)
  #    redirect_to @new_enemy, notice: "New enemy was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /new_enemies/1
  #def destroy
  #  @new_enemy.destroy
  #  redirect_to new_enemies_url, notice: "New enemy was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_enemy
      @new_enemy = NewEnemy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_enemy_params
      params.require(:new_enemy).permit(:result_no, :generate_no, :enemy_id)
    end
end
