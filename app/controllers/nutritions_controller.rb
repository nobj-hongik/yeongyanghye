class NutritionsController < ApplicationController
  before_action :set_nutrition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :result, :new, :edit, :update, :destroy]
  # GET /nutritions
  # GET /nutritions.json
  
  def index
    
    if params[:function]
      @function = params[:function]
      @nutritions = Nutrition.where(:function => @function).order('created_at DESC')
    else  
      @nutritions = Nutrition.all
    end
    
  end

  # GET /nutritions/1
  # GET /nutritions/1.json
  def show
  end

  # GET /nutritions/new
  def new
    @nutrition = Nutrition.new
  end

  # GET /nutritions/1/edit
  def edit
  end

  # nutrition /nutritions
  # nutrition /nutritions.json
  def create
    @nutrition = Nutrition.new(nutrition_params)

    respond_to do |format|
      if @nutrition.save
        format.html { redirect_to @nutrition, notice: 'Nutrition was successfully created.' }
        format.json { render :show, status: :created, location: @nutrition }
      else
        format.html { render :new }
        format.json { render json: @nutrition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nutritions/1
  # PATCH/PUT /nutritions/1.json
  def update
    respond_to do |format|
      if @nutrition.update(nutrition_params)
        format.html { redirect_to @nutrition, notice: 'Nutrition was successfully updated.' }
        format.json { render :show, status: :ok, location: @nutrition }
      else
        format.html { render :edit }
        format.json { render json: @nutrition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutritions/1
  # DELETE /nutritions/1.json
  def destroy
    @nutrition.destroy
    respond_to do |format|
      format.html { redirect_to nutritions_url, notice: 'Nutrition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def result
   
    if params[:func]
      # @search = params[:search]
      # @func1 = '+' + params[:func][i] + '*'
      # @piro = ' -' + params[:piro] + '*'
      # @industry = ' +' + params[:skin] + '*'
      # @computer = ' +' + params[:imuen] + '*'
      
      make_params_ary
      
      if params[:except]
        @except = '%' + params[:except] + '%'
      elsif
        @except = "쓰레기값"
      end
      
      if params[:mfds] == '인증'
        @mfds = params[:mfds]
        @nutritions = Nutrition.find_by_sql(["SELECT * FROM nutritions WHERE MATCH (function, shape, companyinfo) AGAINST ( ? IN BOOLEAN MODE)
                                   AND except NOT LIKE  ? AND mfds = ? ", @funcwords, @except, @mfds])      
      else
        @nutritions = Nutrition.find_by_sql(["SELECT * FROM nutritions WHERE MATCH (function, shape, companyinfo) AGAINST ( ? IN BOOLEAN MODE)
                                   AND except NOT LIKE  ? ", @funcwords, @except])        
      end

      # @nutritions = nutrition.find(:all, :id => ["SELECT id FROM unutritions WHERE match(title,content) against(+%?% IN BOOLEAN MODE)",@search])
      # @nutritions = nutrition.where(:title => @search).order("created_at DESC")
    else
      @nutritions = Nutrition.order('created_at DESC')
    end                                  
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutrition
      @nutrition = Nutrition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nutrition_params
      params.require(:nutrition).permit(:name, :brand, :character, :function, :precaution, :user_id)
    end
    
    def make_params_ary
          @funcwords = "defaultword"
          @exceptwords = "-defaultword"
      for i in 0..13
        if params[:func]
          @funcwords = @funcwords + ' +' + params[:func][i] + '*' if params[:func][i]
        end  
      end
      
      for j in 0..2
        if params[:shape]
          @funcwords = @funcwords + ' +' + params[:shape][j] + '*' if params[:shape][j]
        end
      end
      
    end    
end
