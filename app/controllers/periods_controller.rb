class PeriodsController < ApplicationController
  before_action :find_isnt
  before_action :find_period, except: [:index, :new, :create]

  def index
  end

  def show
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)
    @period[:institution_id] = params[:institution_id]
    if @period.save
      redirect_to institution_period_path(@institution, @period), success: "Class period successfully saved!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @period.update(period_params)
      redirect_to institution_period_path(@institution, @period), success: "#{@period.teacher} successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @period.destroy
    redirect_to institution_periods_path(@institution), success: "Class period deleted!"
  end

  private

    def period_params
      params.require(:period).permit(:teacher, :grade)
    end

    def find_inst
      @institution = Institution.find(params[:institution_id])
    end

    def find_period
      @period = Period.find(params[:id])
    end
end
