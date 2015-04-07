module API
  module V1
    class Search < Grape::API
      include API::V1::Defaults
      include Grape::Rails::Cache
      
      resource :search do
        desc "Return a broadcast containing query param"
        params do
          requires :contains, type: String, desc: "search param"
        end
        get "", root: "search", each_serializer: SimpleBroadcastSerializer do
          broadcasts = Broadcast.contains(params[:contains])
          cache(key: "api:broadcasts:#{params[:contains]}", expires_in: 7.days) do
              render broadcasts: broadcasts
            end
        end
      end
    end
  end
end