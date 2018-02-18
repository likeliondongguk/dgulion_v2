class CurrisController < ApplicationController
  before_action :set_curri, only: [:show, :edit, :update, :destroy]

  # GET /curris
  # GET /curris.json
  def index
    @curris = Curri.all
  end

  # GET /curris/1
  # GET /curris/1.json
  def show
  end

  # GET /curris/new
  def new
    @curri = Curri.new
  end

  # GET /curris/1/edit
  def edit
  end

  # POST /curris
  # POST /curris.json
  def create
    @curri = Curri.new(curri_params)

    respond_to do |format|
      if @curri.save
        format.html { redirect_to @curri, notice: 'Curri was successfully created.' }
        format.json { render :show, status: :created, location: @curri }
      else
        format.html { render :new }
        format.json { render json: @curri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curris/1
  # PATCH/PUT /curris/1.json
  def update
    respond_to do |format|
      if @curri.update(curri_params)
        format.html { redirect_to @curri, notice: 'Curri was successfully updated.' }
        format.json { render :show, status: :ok, location: @curri }
      else
        format.html { render :edit }
        format.json { render json: @curri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curris/1
  # DELETE /curris/1.json
  def destroy
    @curri.destroy
    respond_to do |format|
      format.html { redirect_to curris_url, notice: 'Curri was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curri
      @curri = Curri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curri_params
      params.require(:curri).permit(:title,:image,:desc)
    end
end
