# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChequesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cheques').to route_to('cheques#index')
    end

    it 'routes to #show' do
      expect(get: '/cheques/1').to route_to('cheques#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/cheques').to route_to('cheques#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/cheques/1').to route_to('cheques#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/cheques/1').to route_to('cheques#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/cheques/1').to route_to('cheques#destroy', id: '1')
    end
  end
end
