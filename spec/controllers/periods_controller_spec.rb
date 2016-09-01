require 'rails_helper'

RSpec.describe PeriodsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "sets the periods instance variable" do
      get :index
      expect(assigns(:periods)).to eq([])
    end

    it "returns the correct periods in the periods instance variable" do
      create_list(:period, 5)
      get :index
      expect(assigns(:periods).count).to eq(5)
    end
  end

  describe "GET #show" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      @institution_id = @institution[:id]
      @period = FactoryGirl.create(:period, :grade1, institution_id: @institution_id)
      get :show, params = {id: @period.id, institution_id: @institution_id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the period instance variable" do
      expect(assigns(:period)).to eq(@period)
    end

    it "it renders the show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
