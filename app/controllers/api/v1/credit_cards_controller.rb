# frozen_string_literal: true

module Api
  module V1
    class CreditCardsController < ApplicationController
      include CreditCardsHelper
      before_action :set_credit_card, only: %i[show update destroy]

      # GET /credit_cards
      def index
        @credit_cards = CreditCard.all

        render json: @credit_cards
      end

      # GET /credit_cards/1
      def show
        render json: @credit_card
      end

      # POST /credit_cards
      def create
        if credit_card_balance_initializer(credit_card_params) === true
          @credit_card = CreditCard.create(cardholder_name: credit_card_params[:cardholder_name],
                                           account_id: credit_card_params[:account_id], card_balance: credit_card_params[:card_balance])
          @credit_card.card_number = credit_card_16_d_number_generator
          @credit_card.card_cvv = credit_card_cvv
          @credit_card.card_expiry_date = credit_card_expiry_date
          if @credit_card.save
            render json: 'Credit Card created successfuly'.to_json, status: :ok
          else
            render json: 'Credit Card is not created'.to_json, status: :unprocessable_entity
          end

        else
          render json: 'Not Enough balance in your account'.to_json, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /credit_cards/1
      def update
        if @credit_card.update(credit_card_params)
          render json: @credit_card
        else
          render json: @credit_card.errors, status: :unprocessable_entity
        end
      end

      # DELETE /credit_cards/1
      def destroy
        @credit_card.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_credit_card
        @credit_card = CreditCard.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def credit_card_params
        params.permit(:cardholder_name, :card_number, :card_cvv, :card_expiry_date, :card_balance, :account_id,
                      :user_id)
      end
    end
  end
end
