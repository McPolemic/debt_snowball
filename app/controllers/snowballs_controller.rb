class SnowballsController < ApplicationController
  before_action :set_snowball, only: [:show, :edit, :update, :destroy]

  # GET /snowballs
  # GET /snowballs.json
  def index
    @snowballs = Snowball.all
  end

  # GET /snowballs/1
  # GET /snowballs/1.json
  def show
    @total_balance = @snowball.accounts.map(&:current_balance).sum
  end

  # GET /snowballs/new
  def new
    @snowball = Snowball.new
  end

  # GET /snowballs/1/edit
  def edit
  end

  # POST /snowballs
  # POST /snowballs.json
  def create
    @snowball = Snowball.new(snowball_params)

    respond_to do |format|
      if @snowball.save
        format.html { redirect_to @snowball, notice: 'Snowball was successfully created.' }
        format.json { render :show, status: :created, location: @snowball }
      else
        format.html { render :new }
        format.json { render json: @snowball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snowballs/1
  # PATCH/PUT /snowballs/1.json
  def update
    respond_to do |format|
      if @snowball.update(snowball_params)
        format.html { redirect_to @snowball, notice: 'Snowball was successfully updated.' }
        format.json { render :show, status: :ok, location: @snowball }
      else
        format.html { render :edit }
        format.json { render json: @snowball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snowballs/1
  # DELETE /snowballs/1.json
  def destroy
    @snowball.destroy
    respond_to do |format|
      format.html { redirect_to snowballs_url, notice: 'Snowball was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snowball
      @snowball = Snowball.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snowball_params
      params.require(:snowball).permit(:name)
    end
end
