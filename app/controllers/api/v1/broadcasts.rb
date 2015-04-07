module API
  module V1
    class Broadcasts < Grape::API
      include API::V1::Defaults
      include Grape::Rails::Cache
      
      resource :broadcasts do
        desc "Return all broadcasts"
        get "", root: :broadcasts, each_serializer: SimpleBroadcastSerializer do
          if params[:year].present?
            broadcasts = Broadcast.year(params[:year]).order('broadcast_date ASC')
            cache(key: "api:broadcasts:#{params[:year]}", expires_in: 7.days) do
              render broadcasts: broadcasts
            end
          elsif params[:contains].present?
            broadcasts = Broadcast.contains(params[:contains])
            cache(key: "api:broadcasts:#{params[:contains]}", expires_in: 7.days) do
              render broadcasts: broadcasts
            end
          elsif params[:featured].present?
            broadcasts = Broadcast.featured
            cache(key: "api:broadcasts:featured", expires_in: 7.days) do
              render broadcasts: broadcasts
            end
          elsif params[:highlights].present?
            broadcasts = Broadcast.highlights
            cache(key: "api:broadcasts:highlights", expires_in: 7.days) do
              render broadcasts: broadcasts
            end
          else
            "you need to supply a year query parameter value like /broadcasts?year=2015, or use /broadcasts/latest"
          end
        end

        desc "Return latest broadcast"
        get "latest", root: :broadcasts do
          broadcasts = Broadcast.get_latest.as_json(:include => { :mixes => { :include => :tracks }})
          render broadcasts: broadcasts
        end

        desc "Return a broadcast"
        params do
          requires :id, type: String, desc: "ID of the broadcast"
        end
        get ":id", root: "broadcast", serializer: BroadcastSerializer do
          broadcasts = Broadcast.find(permitted_params[:id]).as_json(:include => { :mixes => { :include => :tracks }})
          render broadcasts: broadcasts
        end
      end
    end
  end
end