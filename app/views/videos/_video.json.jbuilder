# frozen_string_literal: true

json.extract! video, :id, :title, :category_id, :clip, :poster, :created_at, :updated_at
json.category video.category.name
json.clip_type video.clip.content_type
