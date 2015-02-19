require 'rails_helper'


RSpec.describe BroadcastsController, :type => :controller do

  let(:valid_attributes) {
    {
      "session_name" => "My Session Name",
      "broadcast_date" => Date.parse("16/02/2015 15:00")
    }
  }

  let(:invalid_attributes) {
    {
      "session_name" => "",
      "broadcast_date" => ""
    }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all broadcasts as @broadcasts" do
      broadcast = Broadcast.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:broadcasts)).to eq([broadcast])
    end
  end

  describe "GET show" do
    it "assigns the requested broadcast as @broadcast" do
      broadcast = Broadcast.create! valid_attributes
      get :show, {:id => broadcast.to_param}, valid_session
      expect(assigns(:broadcast)).to eq(broadcast)
    end
  end

  describe "GET new" do
    it "assigns a new broadcast as @broadcast" do
      get :new, {}, valid_session
      expect(assigns(:broadcast)).to be_a_new(Broadcast)
    end
  end

  describe "GET edit" do
    it "assigns the requested broadcast as @broadcast" do
      broadcast = Broadcast.create! valid_attributes
      get :edit, {:id => broadcast.to_param}, valid_session
      expect(assigns(:broadcast)).to eq(broadcast)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Broadcast" do
        expect {
          post :create, {:broadcast => valid_attributes}, valid_session
        }.to change(Broadcast, :count).by(1)
      end

      it "assigns a newly created broadcast as @broadcast" do
        post :create, {:broadcast => valid_attributes}, valid_session
        expect(assigns(:broadcast)).to be_a(Broadcast)
        expect(assigns(:broadcast)).to be_persisted
      end

      it "redirects to the created broadcast" do
        post :create, {:broadcast => valid_attributes}, valid_session
        expect(response).to redirect_to(Broadcast.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved broadcast as @broadcast" do
        post :create, {:broadcast => invalid_attributes}, valid_session
        expect(assigns(:broadcast)).to be_a_new(Broadcast)
      end

      it "re-renders the 'new' template" do
        post :create, {:broadcast => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          session_name: "new name",
          broadcast_date: Date.parse("01/01/2012 00:00")
        }
      }

      it "updates the requested broadcast" do
        broadcast = Broadcast.create! valid_attributes
        put :update, {:id => broadcast.to_param, :broadcast => new_attributes}, valid_session
        broadcast.reload
        expect(assigns(:broadcast).session_name).to eq(new_attributes[:session_name])
        expect(assigns(:broadcast).broadcast_date).to eq(new_attributes[:broadcast_date])
      end

      it "assigns the requested broadcast as @broadcast" do
        broadcast = Broadcast.create! valid_attributes
        put :update, {:id => broadcast.to_param, :broadcast => valid_attributes}, valid_session
        expect(assigns(:broadcast)).to eq(broadcast)
      end

      it "redirects to the broadcast" do
        broadcast = Broadcast.create! valid_attributes
        put :update, {:id => broadcast.to_param, :broadcast => valid_attributes}, valid_session
        expect(response).to redirect_to(broadcast)
      end
    end

    describe "with invalid params" do
      it "assigns the broadcast as @broadcast" do
        broadcast = Broadcast.create! valid_attributes
        put :update, {:id => broadcast.to_param, :broadcast => invalid_attributes}, valid_session
        expect(assigns(:broadcast)).to eq(broadcast)
      end

      it "re-renders the 'edit' template" do
        broadcast = Broadcast.create! valid_attributes
        put :update, {:id => broadcast.to_param, :broadcast => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested broadcast" do
      broadcast = Broadcast.create! valid_attributes
      expect {
        delete :destroy, {:id => broadcast.to_param}, valid_session
      }.to change(Broadcast, :count).by(-1)
    end

    it "redirects to the broadcasts list" do
      broadcast = Broadcast.create! valid_attributes
      delete :destroy, {:id => broadcast.to_param}, valid_session
      expect(response).to redirect_to(broadcasts_url)
    end
  end

end
