module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'loaded articles', data: articles}, status: :ok
      end
      def show
        article = Article.find(params[:id])
        render json: {status: 'SUCCESS', message: 'loaded article', data: article}, status: :ok
      end
      def create
        article = Article.new(article_params)

        if article.save
          render json: {status: 'SUCCESS', message: 'saved article', data: article}, status: :ok
        else
          render json: {status: 'Error', message: 'article not saved', data: article.errors},
          status: :unprocessable_entity
        end
      end
      def destroy
        article = Article.find(params).destroy
        render json: {status: 'SUCCESS', message: 'Deleted article', data: article},
        status: :ok
      end
      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: 'SUCCESS', message: 'updated article', data: article}, status: :ok
        else
          render json: {status: 'Error', message: 'article not updated', data: article.errors},
          status: :unprocessable_entity
        end

        end

        private

      def article_params
        params.permit(:title, :body)
      end
    end
  end
end
