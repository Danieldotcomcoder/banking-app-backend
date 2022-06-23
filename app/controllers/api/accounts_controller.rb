# frozen_string_literal: true

module Api
  class AccountsController < ApplicationController
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
      time = Time.now
      @account = Account.create(account_params)
      @account.number = time.strftime("%d%m%Y") + '-' + rand(10000000..99999999).to_s
       if @account.save
         render json: 'Account Created sucessfully'.to_json, status: :ok 
      else
         render json: 'Something went wrong'.to_json, status: :error
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
      params.permit(:name, :account_type, :pin, :status, :user_id)
    end
  end
end
