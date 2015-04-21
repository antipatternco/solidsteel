class BroadcastsController < ApplicationController

	def show
		@broadcast = Broadcasts.find(params[:id])
		render json: @broadcast
	end

	def year
		@broadcasts = Broadcast.year(params[:year]).order('broadcast_date ASC')
		render json: @broadcasts
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
