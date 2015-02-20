require 'rails_helper'

RSpec.describe MixesController, :type => :controller do

  before(:each) do
    @broadcast = FactoryGirl.create(:broadcast)
  end

  let(:valid_attributes) {
    { "name" => "foo",
      "url" => "http://foo"
    }
  }

  let(:invalid_attributes) {
    { 
      "url" => ""
    }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all mixes as @mixes" do
      mix = Mix.create! valid_attributes
      get :index, { :broadcast_id => 1 }, valid_session
      expect(assigns(:mixes)).to eq([mix])
    end
  end

  describe "GET show" do
    it "assigns the requested mix as @mix" do
      mix = Mix.create! valid_attributes
      get :show, {:id => mix.to_param, :broadcast_id => @broadcast.id}, valid_session
      expect(assigns(:mix)).to eq(mix)
    end
  end

  describe "GET new" do
    it "assigns a new mix as @mix" do
      get :new, { :broadcast_id => @broadcast.id }, valid_session
      expect(assigns(:mix)).to be_a_new(Mix)
    end
  end

  describe "GET edit" do
    it "assigns the requested mix as @mix" do
      mix = Mix.create! valid_attributes
      get :edit, {:id => mix.to_param, :broadcast_id => @broadcast.id}, valid_session
      expect(assigns(:mix)).to eq(mix)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Mix" do
        expect {
          post :create, {:mix => valid_attributes, :broadcast_id => @broadcast.id}, valid_session
        }.to change(Mix, :count).by(1)
      end

      it "assigns a newly created mix as @mix" do
        post :create, {:mix => valid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(assigns(:mix)).to be_a(Mix)
        expect(assigns(:mix)).to be_persisted
      end

      it "redirects to the created mix" do
        post :create, {:mix => valid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(response).to redirect_to(broadcast_mixes_path(Mix.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mix as @mix" do
        post :create, {:mix => invalid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(assigns(:mix)).to be_a_new(Mix)
      end

      it "re-renders the 'new' template" do
        post :create, {:mix => invalid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          "name" => "bar"
        }
      }

      it "updates the requested mix" do
        mix = Mix.create! valid_attributes
        put :update, {:id => mix.to_param, :mix => new_attributes, :broadcast_id => @broadcast.id}, valid_session
        mix.reload
        expect(assigns(:mix).name).to eq('bar')
        expect(assigns(:mix).url).to eq('http://foo')
      end

      it "assigns the requested mix as @mix" do
        mix = Mix.create! valid_attributes
        put :update, {:id => mix.to_param, :mix => valid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(assigns(:mix)).to eq(mix)
      end

      it "redirects to the mix" do
        mix = Mix.create! valid_attributes
        put :update, {:id => mix.to_param, :mix => valid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(response).to redirect_to(broadcast_mixes_path(mix))
      end
    end

    describe "with invalid params" do
      it "assigns the mix as @mix" do
        mix = Mix.create! valid_attributes
        put :update, {:id => mix.to_param, :mix => invalid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(assigns(:mix)).to eq(mix)
      end

      it "re-renders the 'edit' template" do
        mix = Mix.create! valid_attributes
        put :update, {:id => mix.to_param, :mix => invalid_attributes, :broadcast_id => @broadcast.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested mix" do
      mix = Mix.create! valid_attributes
      expect {
        delete :destroy, {:id => mix.to_param, :broadcast_id => @broadcast.id}, valid_session
      }.to change(Mix, :count).by(-1)
    end

    it "redirects to the mixes list" do
      mix = Mix.create! valid_attributes
      delete :destroy, {:id => mix.to_param, :broadcast_id => @broadcast.id}, valid_session
      expect(response).to redirect_to(broadcast_mixes_url)
    end
  end

end
