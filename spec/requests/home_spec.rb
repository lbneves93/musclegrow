require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'LIST home' do
    before { get root_path }

    context 'when has not exercises' do
      it { expect(response).to have_http_status(:success) }

      it 'returns empty' do
        expect(assigns(:exercises)).to be_empty
      end
    end

    context 'when has exercises' do
      before { create_list(:exercise, 3) }

      it { expect(response).to have_http_status(:success) }

      it 'returns 3 exercises' do
        expect(assigns(:exercises).count).to eq(3)
      end
    end
  end
end