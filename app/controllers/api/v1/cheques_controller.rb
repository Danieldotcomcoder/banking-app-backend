# frozen_string_literal: true

module Api
  module V1
    class ChequesController < ApplicationController
      before_action :set_cheque, only: %i[show update destroy]

      # GET /cheques
      def index
        @cheques = Cheque.all

        render json: @cheques
      end

      # GET /cheques/1
      def show
        render json: @cheque
      end

      # POST /cheques
      def create
        @cheque = Cheque.new(cheque_params)

        if @cheque.save
          render json: @cheque, status: :created, location: @cheque
        else
          render json: @cheque.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /cheques/1
      def update
        if @cheque.update(cheque_params)
          render json: @cheque
        else
          render json: @cheque.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cheques/1
      def destroy
        @cheque.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_cheque
        @cheque = Cheque.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def cheque_params
        params.permit(:cheque_number, :cheque_bank, :cheque_name, :cheque_amount)
      end
    end
  end
end
