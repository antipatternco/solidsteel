module API
  module V1
    class Djs < Grape::API
      include API::V1::Defaults
      include Grape::Rails::Cache

      resource :djs do
        desc "Return all DJs"
        get "", root: :djs, each_serializer: DJSerializer do
          if params[:alpha].present?
            broadcastTags = Broadcast.tag_counts.where('name like ?', "#{params[:alpha]}%").order('name')
            cache(key: "api:djs:#{params[:alpha]}", expires_in: 7.days) do
              render djs: broadcastTags
            end
          else
            "you need to supply an alphabetical letter to search by"
          end
        end
      end
    end
  end
end