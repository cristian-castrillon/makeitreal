module Api
  module V1
    class UsersController < ApplicationController
      def create
        # params payload = {
        #   user: {
        #     username: '',
        #     full_name: ''
        #   }
        # }
        safe_params = params.require(:user).permit(:username, :full_name)
        user = User.new(safe_params)
        if user.save
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def show
        user = User.includes(:articles).find(params[:id])
        render json: { user: user, articles: user.articles }
      end

      # def get_articles
      #   user = User.find(params[:id])
      #   render json: user.articles
      # end
    end
  end
end

