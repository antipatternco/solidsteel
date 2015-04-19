class BroadcastsController < ApplicationController

    caches_page :show
    
    def show
        Broadcast.find(params[:id])
    end

end
