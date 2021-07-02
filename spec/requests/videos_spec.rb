# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/videos', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Video. As you add validations to Video, be sure to
  # adjust the attributes here as well.
  let(:category) { create :category }
  let(:valid_attributes) do
    {
      title: 'Untitled 1',
      category_id: category.id,
      clip: Rack::Test::UploadedFile.new(Rails.root.join / 'spec' / 'fixtures' / 'test.mov', 'video/quicktime'),
      poster: Rack::Test::UploadedFile.new(Rails.root.join / 'spec' / 'fixtures' / 'avatar.png', 'image/png')
    }
  end

  let(:invalid_attributes) do
    {
      title: nil,
      category_id: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Video.create! valid_attributes
      get videos_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      video = Video.create! valid_attributes
      get video_url(video), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Video' do
        expect do
          post videos_url,
               params: { video: valid_attributes }, as: :json
        end.to change(Video, :count).by(1)
      end

      it 'renders a JSON response with the new video' do
        post videos_url,
             params: { video: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Video' do
        expect do
          post videos_url,
               params: { video: invalid_attributes }, as: :json
        end.to change(Video, :count).by(0)
      end

      it 'renders a JSON response with errors for the new video' do
        post videos_url,
             params: { video: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    let(:category2) { create :category }

    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: 'untitled 01',
          category_id: category2.id
        }
      end

      it 'updates the requested video' do
        video = Video.create! valid_attributes
        patch video_url(video),
              params: { video: new_attributes }, as: :json
        video.reload
        expect(video.category_id).to eq(category2.id)
        expect(video.title).to eq(new_attributes[:title])
      end

      it 'renders a JSON response with the video' do
        video = Video.create! valid_attributes
        patch video_url(video),
              params: { video: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the video' do
        video = Video.create! valid_attributes
        patch video_url(video),
              params: { video: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested video' do
      video = Video.create! valid_attributes
      expect do
        delete video_url(video), as: :json
      end.to change(Video, :count).by(-1)
    end
  end
end