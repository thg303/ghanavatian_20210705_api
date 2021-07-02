# frozen_string_literal: true

# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  title       :string
#  category_id :bigint           not null
#  clip        :string
#  poster      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord
  belongs_to :category
  mount_uploader :clip, ClipUploader
  mount_uploader :poster, PosterUploader

  validates :title, presence: true
  validates :category_id, presence: true
end
