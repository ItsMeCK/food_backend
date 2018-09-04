class ParentsController < ApplicationController

	respond_to :html, :json
  #layout :condition_find 
  # GET /parents
  # GET /parents.json
  
  def index
    @parents = Parent.search(params[:search]) || []
    @parents = @parents.verified(params[:verified].to_s == "true" ? true : false) if params[:verified].present?
    #@parents = @parents.paginate(:per_page => 3, :page => params[:page])
    respond_to do |format|
    	format.html
      format.json { render json: @parents}
    end
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    #@reviews = @parent.reviews
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    
    @parent = Parent.new(parent_params)
    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
        format.json { render json: @parent}
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def verified
    Parent.where(:id => params[:parent_ids]).each do |parent|
    	parent.update(verified: !parent.verified)
    end	
    redirect_to parents_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:email, :password, :name, :mobile, :verified, :as_active, :password, :password_confirmation)
    end

end
