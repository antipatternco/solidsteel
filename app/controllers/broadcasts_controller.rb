class BroadcastsController < ApplicationController

    caches_page :year, :search, :featured, :highlights, :show, :djs

    def year
        @broadcasts = Broadcast.year(params[:year]).order('broadcast_date ASC')
        render 'index'
    end

    def search
        @broadcasts = Broadcast.contains(params[:searchterm])
        render 'index'
    end

    def featured
        @broadcasts = Broadcast.featured
        render 'index'
    end

    def highlights
        @broadcasts = Broadcast.highlights
        render 'index'
    end

    def latest
        @broadcast = Broadcast.get_latest
        render 'show'
    end

    def show
        @broadcast = Broadcast.find(params[:id])
    end

    def djs
        @djs = Broadcast.tag_counts.where('name like ?', "#{params[:alpha]}%").order('name')
    end

end