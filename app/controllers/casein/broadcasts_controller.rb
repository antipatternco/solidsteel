module Casein
  class BroadcastsController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def landing

    end
    
    def index
      @casein_page_title = 'Broadcasts'
  		@broadcasts = Broadcast.order("broadcast_date DESC").paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View broadcast'
      @broadcast = Broadcast.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new broadcast'
    	@broadcast = Broadcast.new
    end

    def create
      @broadcast = Broadcast.new broadcast_params

      if @broadcast.sheet_to_show
        flash[:notice] = 'Broadcast created'
        redirect_to casein_broadcasts_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new broadcast'
        render :action => :new
      end
    end

    def update
      @casein_page_title = 'Update broadcast'
      
      @broadcast = Broadcast.find params[:id]
      puts params
      puts params
      puts params
      puts params

      if params[:delete_image] == "delete_image"
        @broadcast.image.clear
        @broadcast.save
        flash[:notice] = 'image deleted'
        redirect_to casein_broadcast_path(@broadcast)
      else
        if @broadcast.update_attributes broadcast_params
          flash[:notice] = 'Broadcast has been updated'
          redirect_to casein_broadcasts_path
        else
          flash.now[:warning] = 'There were problems when trying to update this broadcast'
          render :action => :show
        end
      end
    end
 
    def destroy
      @broadcast = Broadcast.find params[:id]

      @broadcast.destroy
      flash[:notice] = 'Broadcast has been deleted'
      redirect_to casein_broadcasts_path
    end
  
    private
      
      def broadcast_params
        params.require(:broadcast).permit(:session_name, :broadcast_date, :notes, :altnotes, :image, :featured, :highlight, :spreadsheet, :delete_image, :tag_list => [], mixes_attributes: [:id, :url, :name])
      end

  end
end