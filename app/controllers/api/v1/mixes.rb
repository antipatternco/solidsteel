module API
  module V1
    class Mixes < Grape::API
      include API::V1::Defaults

      resource :mixes do
        desc "Return all mixes"
        get "", root: :mixes do
          Mix.all
        end

        desc "Return a mix"
        params do
          requires :id, type: String, desc: "ID of the mix"
        end
        get ":id", root: "mix" do
          Mix.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end