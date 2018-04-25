class NewEnemiesController < ApplicationController
  include MyUtility
  before_action :set_new_enemy, only: [:show, :edit, :update, :destroy]

  # GET /new_enemies
  def index
    param_set
    @count	= NewEnemy.includes([:enemy_name]).search(params[:q]).result.count()
    @search	= NewEnemy.includes([:enemy_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_enemies	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_text_assign(params, "enemy_name_name", "enemy_form")
    
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @enemy_form = params["enemy_form"]
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
  #    redirect_to @new_enemy, notice: 'New enemy was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /new_enemies/1
  #def update
  #  if @new_enemy.update(new_enemy_params)
  #    redirect_to @new_enemy, notice: 'New enemy was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /new_enemies/1
  #def destroy
  #  @new_enemy.destroy
  #  redirect_to new_enemies_url, notice: 'New enemy was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_enemy
      @new_enemy = NewEnemy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_enemy_params
      params.require(:new_enemy).permit(:result_no, :generate_no, :enemy)
    end
end
