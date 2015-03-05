module API
  module V1
    class Broadcasts < Grape::API
      include API::V1::Defaults

      resource :broadcasts do
        desc "Return all broadcasts"
        get "", root: :broadcasts do
          Broadcast.last
        end

        desc "Return latest broadcast"
        get "latest", root: :broadcasts do
          Broadcast.last
        end

        desc "Return a broadcast"
        params do
          requires :id, type: String, desc: "ID of the broadcast"
        end
        get ":id", root: "broadcast" do
          Broadcast.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end