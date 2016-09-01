require 'rails_helper'

RSpec.describe InstitutionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the institution instance variable' do
      get :index
      expect(assigns(:institutions)).to eq([])
    end

    it 'has institutions in the instance variable' do
      create_list(:institution, 5)
      get :index
      expect(assigns(:institutions).count).to eq(5)
      expect(assigns(:institutions).first.name).to eq('Ann')
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      get :show, id: @institution.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the institution instance variable" do
      expect(assigns(:institution)).to eq(@institution)
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the country instance variable" do
      expect(assigns(:institution)).to_not eq(nil)
      expect(assigns(:institution).class).to eq(Institution)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      get :edit, id: @institution.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the country instance variable" do
      expect(assigns(:institution)).to eq(@institution)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before(:each) do
      @create_params = {name: 'test', grade_level: '8', mascot: 'Bobcat', rating: 4}
    end

    context 'valid params' do
      before(:each) do
        post :create, params: {institution: @create_params}
      end

      it "sets the instance variable" do
        expect(assigns(:institution).name).to eq('test')
      end

      it "successfully creates an institution" do
        expect(Institution.count).to eq(1)
        expect(Institution.first.name).to eq('test')
      end

      it "redirects to the show on success" do
        expect(response).to redirect_to institution_path(Institution.first)
      end
    end

    context 'with invalid params' do
      it "renders the new template on unsuccessful create" do
        @create_params[:name] = ''
        post :create, params: {institution: @create_params}
        expect(response).to render_template(:new)
        expect(Institution.count).to eq(0)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      @update_params = {name: 'updated by a test'}
    end

    context 'valid params' do
      before(:each) do
        put :update, params: { id: @institution.id, institution: @update_params }
      end

      it "sets the institution instance variable" do
        expect(assigns(:institution)).to eq(@institution)
      end

      it "successfully updates an institution" do
        expect(@institution.reload.name).to eq(@update_params[:name])
      end

      it "redirects to the institution show on update" do
        expect(response).to redirect_to institution_path(@institution)
      end
    end

    context 'invalid params' do
      it "renders the edit template on fail" do
        @update_params[:name] = ''
        put :update, params: { id: @institution.id, institution: @update_params }
        expect(response).to render_template(:edit)
        expect(@institution.reload.name).to eq('Ann')
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      delete :destroy, params: { id: @institution.id }
    end

    it "sets the institution instanct variable" do
      expect(assigns(:institution)).to eq(@institution)
    end

    it "successfully deletes an institution" do
      expect(Institution.count).to eq(0)
    end

    it "redirects to the index on success" do
      expect(response).to redirect_to institutions_path
    end
  end
end
