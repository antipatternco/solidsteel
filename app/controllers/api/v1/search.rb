module API
  module V1
    class Search < Grape::API
      include API::V1::Defaults

      resource :search do
        desc "Return a broadcast containing query param"
        params do
          requires :contains, type: String, desc: "search param"
        end
        get "", root: "search" do
          Broadcast.contains(params[:contains])
        end
      end
    end
  end
end