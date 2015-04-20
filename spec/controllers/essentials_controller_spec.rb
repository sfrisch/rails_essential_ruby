require 'rails_helper'

RSpec.describe EssentialsController, type: :controller do

  describe "GET #basics_1" do
    it "returns http success" do
      get :basics_1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #arrays_2" do
    it "returns http success" do
      get :arrays_2
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #hashes_3" do
    it "returns http success" do
      get :hashes_3
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #nested_lists_4" do
    it "returns http success" do
      get :nested_lists_4
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #each_5" do
    it "returns http success" do
      get :each_5
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #methods_6" do
    it "returns http success" do
      get :methods_6
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #arguments_7" do
    it "returns http success" do
      get :arguments_7
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #return_values_8" do
    it "returns http success" do
      get :return_values_8
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #classes_9" do
    it "returns http success" do
      get :classes_9
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #challenge_10" do
    it "returns http success" do
      get :challenge_10
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #friendbc_11" do
    it "returns http success" do
      get :friendbc_11
      expect(response).to have_http_status(:success)
    end
  end

end
