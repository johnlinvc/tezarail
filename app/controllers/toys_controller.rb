class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  # GET /toys
  # GET /toys.json
  def index
    @toys = Toy.all

    puts( @c_toy )
    if params[:toy_id]
      @c_toy = Toy.find(params[:toy_id])
    else
      @c_toy = Toy.first
    end
    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /toys/1
  # GET /toys/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /toys/new
  def new
    @toy = Toy.new
  end

  # GET /toys/1/edit
  def edit
  end

  # POST /toys
  # POST /toys.json
  def create
    @toy = Toy.new(toy_params)

    respond_to do |format|
      if @toy.save
        format.html { redirect_to @toy, notice: 'Toy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @toy }
      else
        format.html { render action: 'new' }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toys/1
  # PATCH/PUT /toys/1.json
  def update
    respond_to do |format|
      if @toy.update(toy_params)
        format.html { redirect_to @toy, notice: 'Toy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toys/1
  # DELETE /toys/1.json
  def destroy
    @toy.destroy
    respond_to do |format|
      format.html { redirect_to toys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toy
      @toy = Toy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def toy_params
      params.require(:toy).permit(:name)
    end
end
