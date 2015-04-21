class BroadcastsController < ApplicationController

	caches_page :show, :year, :search, :featured, :latest, :djs

	def show
		@broadcast = Broadcast.find(params[:id])
		render json: @broadcast
	end

	def year
		@broadcasts = Broadcast.year(params[:year]).order('broadcast_date ASC')
		render 'index'
	end

	def search
		@broadcasts = Broadcast.contains(params[:contains])
		render json: @broadcasts
	end

	def featured
		@broadcasts = Broadcast.featured
		render json: @broadcasts
	end

	def latest
		@broadcast = Broadcast.get_latest
		render json: @broadcast
	end

	def djs
		@djs = Broadcast.tag_counts.where('name like ?', "#{params[:alpha]}%").order('name')
	end

end
