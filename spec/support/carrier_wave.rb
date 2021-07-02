# frozen_string_literal: true

CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false
end

RSpec.configure do |config|
  config.include CarrierWave::Test::Matchers

  config.after do
    FileUtils.rm_rf(Dir[Rails.root.join / 'spec' / 'uploads'])
  end
end
