# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      include AccountsHelper
      before_action :set_account, only: %i[show update destroy]

      # GET /accounts
      def index
        @accounts = Account.all
        render json: @accounts
      end

      # GET /accounts/1
      def show
        render json: @account
      end

      # POST /accounts
      def create
        if account_type_checker(account_params[:account_type]) == true
          @account = Account.create(account_params)
          @account.number = account_number_generator(account_params[:account_type])
          if @account.save
            render json: 'Account Created sucessfully'.to_json, status: :ok
          else
            render json: 'Something went wrong, Account was not created'.to_json, status: :unprocessable_entity
          end
        else
          render json: 'Account type doesnt exist'.to_json, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /accounts/1
      def update
        if @account.update(account_params)
          render json: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end

      # DELETE /accounts/1
      def destroy
        @account.destroy
        if @account.destroyed?
          render json: 'Account Deleted sucessfully'.to_json, status: :ok
        else
          render json: 'Something went wrong, Account is not deleted'.to_json, status: :error
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_account
        @account = Account.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def account_params
        params.permit(:name, :account_type, :pin, :status, :user_id, :balance)
      end
    end
  end
end
