module API
  module V1
    class Djs < Grape::API
      include API::V1::Defaults

      resource :djs do
        desc "Return all DJs"
        get "", root: :djs, each_serializer: DJSerializer do
          if params[:alpha].present?
            Broadcast.tag_counts.where('name like ?', "#{params[:alpha]}%").order('name')
          else
            "you need to supply an alphabetical letter to search by"
          end
        end
      end
    end
  end
end