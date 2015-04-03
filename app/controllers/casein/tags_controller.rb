module Casein
  class TagsController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
    
    def index
      @casein_page_title = 'tags'
     # @tags = ActsAsTaggableOn::Tag.all.order("name ASC").paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View tag'
      @tag = tag.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new tag'
      @tag = ActsAsTaggableOn::Tag.new
      puts "** ** ** ** ** **"
      puts @tag.inspect
      puts "?? ?? ?? ?? ?? ??"
    end

    def create
      @tag = ActsAsTaggableOn::Tag.new tag_params

      if @tag.save
        flash[:notice] = 'tag created'
        redirect_to casein_tags_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new tag'
        render :action => :new
      end
    end

    def update
      @casein_page_title = 'Update tag'
      
      @tag = tag.find params[:id]

      if @tag.update_attributes tag_params
        flash[:notice] = 'tag has been updated'
        redirect_to casein_tags_path
      else
        flash.now[:warning] = 'There were problems when trying to update this tag'
        render :action => :show
      end
    end
 
    def destroy
      @tag = ActsAsTaggableOn::Tag.all.find params[:id]

      @tag.destroy
      flash[:notice] = 'tag has been deleted'
      redirect_to casein_tags_path
    end
  
    private
      
      def tag_params
        params.require(:tag).permit(:tag_list)
      end

  end
end