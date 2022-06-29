# frozen_string_literal: true

module Api
  module V1
    class PaymentsController < ApplicationController
      include PaymentsHelper
      before_action :set_payment, only: %i[show update destroy]

      # GET /payments
      def index
        @payments = Payment.all
        render json: @payments
      end

      # GET /payments/1
      def show
        render json: @payment
      end

      # POST /payments
      def create
        if payment_type_checker(payment_params[:payment_type]) == true
          account_balance_updater_service = AccountBalanceUpdater.new
          if account_balance_updater_service.call(payment_params[:amount].to_i,
                                                  payment_params[:account_id].to_i) == true
            @payment = Payment.new(payment_params)
            if @payment.save
              create_transaction_service = TransactionCreator.new
              create_transaction_service.call(total_amount: payment_params[:amount], transaction_type: payment_params[:payment_type],
                                              account_id: payment_params[:account_id])
              render json: 'Payment Is Made Successfully'.to_json, status: :ok
            else
              render json: 'Something Went Wrong, Payment is not Made'.to_json, status: :unprocessable_entity
            end
          else
            render json: 'Sorry Not Enough Balance'.to_json, status: :unprocessable_entity
          end
        else
          render json: 'Wrong Payment Type'.to_json, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /payments/1
      def update
        if @payment.update(payment_params)
          render json: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /payments/1
      def destroy
        @payment.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_payment
        @payment = Payment.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def payment_params
        params.permit(:currency, :amount, :payment_type, :payment_address, :account_id)
      end
    end
  end
end