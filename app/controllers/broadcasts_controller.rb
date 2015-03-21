class BroadcastsController < ApplicationController
  before_action :set_broadcast, only: [:show, :edit, :update, :destroy]

  # GET /broadcasts
  def index
    @broadcasts = Broadcast.all
  end

  def search
    @broadcasts = Broadcast.contains(params[:contains]).order(sort_order("broadcast_date DESC"))
    render "broadcasts/index"
  end

  # GET /broadcasts
  def latest
    @broadcast = Broadcast.get_latest
  end

  # GET /broadcasts/1
  def show
  end

  # GET /broadcasts/new
  def new
    @broadcast = Broadcast.new
  end

  # GET /broadcasts/1/edit
  def edit
  end

  # POST /broadcasts
  def create
    @broadcast = Broadcast.new(broadcast_params)

    if @broadcast.save
      redirect_to @broadcast, notice: 'Broadcast was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /broadcasts/1
  def update
    if @broadcast.update(broadcast_params)
      redirect_to @broadcast, notice: 'Broadcast was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /broadcasts/1
  def destroy
    @broadcast.destroy
    redirect_to broadcasts_url, notice: 'Broadcast was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast
      @broadcast = Broadcast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def broadcast_params
      params[:broadcast].permit(:session_name, :broadcast_date, :notes, :altnotes, :image)
    end
end
