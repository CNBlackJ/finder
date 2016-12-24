require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:profile)
  }

  let(:invalid_attributes) {
    valid_attributes.merge({sex: 5})
  }

  before(:each) do
    FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "assigns all profiles as @profiles" do
      profile = Profile.create! valid_attributes
      get :index
      expect(assigns(:profiles)).to eq([profile])
    end
  end

  describe "GET #show" do
    it "assigns the requested profile as @profile" do
      profile = Profile.create! valid_attributes
      get :show, params: {id: profile.to_param}
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Profile" do
        expect {
          post :create, params: {profile: valid_attributes}
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        post :create, params: {profile: valid_attributes}
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end

      it "return http status 201" do
        post :create, params: {profile: valid_attributes}
        expect(response).to have_http_status 201
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        post :create, params: {profile: invalid_attributes}
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it "return http status 422" do
        post :create, params: {profile: invalid_attributes}
        expect(response).to have_http_status 422
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge({name: 'new_name'})
      }

      it "updates the requested profile" do
        profile = Profile.create! valid_attributes
        put :update, params: {id: profile.to_param, profile: new_attributes}
        profile.reload
        expect(assigns(:profile)).to eq(profile)
      end

      it "assigns the requested profile as @profile" do
        profile = Profile.create! valid_attributes
        put :update, params: {id: profile.to_param, profile: valid_attributes}
        expect(assigns(:profile)).to eq(profile)
      end

      it "return http status 200" do
        profile = Profile.create! valid_attributes
        put :update, params: {id: profile.to_param, profile: valid_attributes}
        expect(response).to have_http_status 200
      end
    end

    context "with invalid params" do
      it "assigns the profile as @profile" do
        profile = Profile.create! valid_attributes
        put :update, params: {id: profile.to_param, profile: invalid_attributes}
        expect(assigns(:profile)).to eq(profile)
      end

      it "return http status 422" do
        profile = Profile.create! valid_attributes
        put :update, params: {id: profile.to_param, profile: invalid_attributes}
        expect(response).to have_http_status 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested profile" do
      profile = Profile.create! valid_attributes
      expect {
        delete :destroy, params: {id: profile.to_param}
      }.to change(Profile, :count).by(-1)
    end

    it "return http status 204" do
      profile = Profile.create! valid_attributes
      delete :destroy, params: {id: profile.to_param}
      expect(response).to have_http_status 204
    end
  end

end
