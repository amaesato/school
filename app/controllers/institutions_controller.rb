class InstitutionsController < ApplicationController
  before_action :find_isnt, except: [:index, :new, :create]

  def index
    @institutions = Institution.all
  end

  def show
  end

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(inst_params)
    if @institution.save
      redirect_to institution_path(@institution), success: 'New School Added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @institution.update(inst_params)
      redirect_to institution_path(@institution), succes: "#{@institution.name} has been updated"
    else
      render :edit
    end
  end

  def destroy
    @institution.destroy
    redirect_to institutions_path, success: 'School deleted!'
  end

  private

    def inst_params
      params.require(:institution).permit(:name, :grade_level, :mascot, :rating)
    end

    def find_isnt
      @institution = Institution.find(params[:id])
    end
end
