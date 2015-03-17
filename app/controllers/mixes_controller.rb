class MixesController < ApplicationController
  before_action :set_mix, only: [:show, :edit, :update, :destroy]

  # GET /mixes
  def index
    @broadcast = Broadcast.find(params[:broadcast_id])
    @mixes = @broadcast.mixes
  end

  # GET /latest
  def latest
    @mix = Mix.get_latest
  end

  # GET /mixes/1
  def show
    @broadcast = Broadcast.find(params[:broadcast_id])
    @mix = @broadcast.mixes.find(params[:id])
  end

  # GET /mixes/new
  def new
    @mix = Mix.new
  end

  # GET /mixes/1/edit
  def edit
  end 

  # POST /mixes
  def create
    @mix = Mix.new(mix_params)

    if @mix.save
      redirect_to broadcast_mixes_url(@mix), notice: 'Mix was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mixes/1
  def update
    if @mix.update(mix_params)
      redirect_to broadcast_mixes_url(@mix), notice: 'Mix was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mixes/1
  def destroy
    @mix.destroy
    redirect_to broadcast_mixes_url, notice: 'Mix was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mix
      @mix = Mix.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mix_params
      params.require(:mix).permit(:name, :part, :url, :soundcloudId, :mixcloudId, :background_image, :mix_image)
    end
end
