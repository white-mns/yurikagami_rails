class EnemiesController < ApplicationController
  include MyUtility
  before_action :set_enemy, only: [:show, :edit, :update, :destroy]

  # GET /enemies
  def index
    param_set
    @count	= Enemy.includes([:enemy_name]).ransack(params[:q]).result.count()
    @search	= Enemy.includes([:enemy_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @enemies	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "party_no", "party_no_form")
    reference_text_assign(params, "enemy_name_name", "enemy_form")
    reference_text_assign(params, "suffix", "suffix_form")
    
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @party_no_form = params["party_no_form"]
    @enemy_form = params["enemy_form"]
    @suffix_form = params["suffix_form"]
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
  #    redirect_to @enemy, notice: 'Enemy was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /enemies/1
  #def update
  #  if @enemy.update(enemy_params)
  #    redirect_to @enemy, notice: 'Enemy was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /enemies/1
  #def destroy
  #  @enemy.destroy
  #  redirect_to enemies_url, notice: 'Enemy was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enemy
      @enemy = Enemy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enemy_params
      params.require(:enemy).permit(:result_no, :generate_no, :party_no, :enemy, :suffix)
    end
end
