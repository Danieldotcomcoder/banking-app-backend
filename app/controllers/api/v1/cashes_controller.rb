# frozen_string_literal: true

module Api
  module V1
    class CashesController < ApplicationController
      before_action :set_cash, only: %i[show update destroy]

      # GET /cashes
      def index
        @cashes = Cash.all

        render json: @cashes
      end

      # GET /cashes/1
      def show
        render json: @cash
      end

      # POST /cashes
      def create
        @cash = Cash.new(cash_params)

        if @cash.save
          render json: @cash, status: :created, location: @cash
        else
          render json: @cash.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /cashes/1
      def update
        if @cash.update(cash_params)
          render json: @cash
        else
          render json: @cash.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cashes/1
      def destroy
        @cash.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_cash
        @cash = Cash.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def cash_params
        params.permit(:cash_name, :cash_amount)
      end
    end
  end
end
