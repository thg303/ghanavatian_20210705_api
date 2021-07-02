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
FactoryBot.define do
  factory :video do
    title { 'my title' }
    clip { Rack::Test::UploadedFile.new(Rails.root.join / 'spec' / 'fixtures' / 'test.mov', 'video/quicktime') }
    poster { Rack::Test::UploadedFile.new(Rails.root.join / 'spec' / 'fixtures' / 'avatar.png', 'image/png') }

    category
  end
end
