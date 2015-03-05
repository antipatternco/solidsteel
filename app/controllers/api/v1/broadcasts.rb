module API
  module V1
    class Broadcasts < Grape::API
      include API::V1::Defaults

      resource :broadcasts do
        desc "Return all broadcasts"
        get "", root: :broadcasts, each_serializer: SimpleBroadcastSerializer do
          if params[:year].present?
            Broadcast.year(params[:year])
          else
            "you need to supply a year query parameter value like /broadcasts?year=2015, or use /broadcasts/latest"
          end
        end

        desc "Return latest broadcast"
        get "latest", root: :broadcasts, serializer: BroadcastSerializer do
          Broadcast.last
        end

        desc "Return a broadcast"
        params do
          requires :id, type: String, desc: "ID of the broadcast"
        end
        get ":id", root: "broadcast", serializer: BroadcastSerializer do
          Broadcast.find(permitted_params[:id])
        end
      end
    end
  end
end