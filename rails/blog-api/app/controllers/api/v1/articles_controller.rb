module Api
  module V1
    class ArticlesController < ApplicationController
      def index

        render json: Article.where(user_id: params[:user_id])
      end
      def create
        article = Article.new(article_params)
        if article.save
          render json: article
        else
          render json: { errors: article.errors }, status: :unprocessable_entity
        end
      end

      def show
        article = Article.find(params[:id])
        render json: article
      end
      private
        def article_params
          params.require(:article).permit(:title, :body, :user_id)
        end
    end
  end
end


# response = HTTParty.get('http://localhost:3000/api/v1/users/1')
# response['articles'].map do |article_id|
#   HTTParty.get("http://localhost:3000/api/v1/users/1/articles/#{article_id}")
# end