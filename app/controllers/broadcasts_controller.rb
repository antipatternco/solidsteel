class BroadcastsController < ApplicationController

    caches_page :show, :index

    def index
        if params[:year].present?
            @broadcasts = Broadcast.year(params[:year]).order('broadcast_date ASC')
        elsif params[:contains].present?
            @broadcasts = Broadcast.contains(params[:contains])
        elsif params[:featured].present?
            @broadcasts = Broadcast.featured
        elsif params[:highlights].present?
            @broadcasts = Broadcast.highlights
        else
            "you need to supply a year query parameter value like /broadcasts?year=2015, or use /broadcasts/latest"
        end
    end

    def show
        @broadcast = Broadcast.find(params[:id])
    end

end