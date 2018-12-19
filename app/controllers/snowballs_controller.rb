class SnowballsController < ApplicationController
  before_action :set_snowball, only: [:show, :edit, :update, :destroy]

  def index
    @snowballs = Snowball.all
  end

  def show
    @total_initial = @snowball.accounts.map(&:initial_balance).sum
    @total_current = @snowball.accounts.map(&:current_balance).sum
    @total_difference = @total_current - @total_initial
  end

  def new
    @snowball = Snowball.new
  end

  def edit
  end

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

  def destroy
    @snowball.destroy
    respond_to do |format|
      format.html { redirect_to snowballs_url, notice: 'Snowball was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_snowball
    @snowball = Snowball.find(params[:id])
  end

  def snowball_params
    params.require(:snowball).permit(:name)
  end
end
