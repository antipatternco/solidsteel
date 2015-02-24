module API
  module V1
    class Tracks < Grape::API
      include API::V1::Defaults

      resource :tracks do
        desc "Return all tracks"
        get "", root: :tracks do
          Track.all
        end

        desc "Return a track"
        params do
          requires :id, type: String, desc: "ID of the track"
        end
        get ":id", root: "track" do
          Track.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end