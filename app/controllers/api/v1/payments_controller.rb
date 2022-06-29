# frozen_string_literal: true

module Api
  class PaymentsController < ApplicationController
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
      if PaymentsHelper.payment_type_checker(payment_params[:payment_type]) == true
        @payment = Payment.new(payment_params)
        if @payment.save
          service = TransactionCreator.new
          service.call(total_amount: payment_params[:amount], transaction_type: payment_params[:payment_type],
                       account_id: payment_params[:account_id])
          service2 = AccountBalanceUpdater.new
          service2.call(payment_params[:amount].to_i, payment_params[:account_id].to_i)
          render json: 'Payment Is Made sucessfully'.to_json, status: :ok
        else
          render json: @payment.errors, status: :unprocessable_entity
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
