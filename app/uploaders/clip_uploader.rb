# frozen_string_literal: true

class ClipUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    return test_upload_path if Rails.env.test?

    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :poster do
    process thumbnail: [{ format: 'png', quality: 10, size: 256, square: true, strip: false, logger: Rails.logger }]

    def full_filename(for_file)
      png_name for_file, version_name
    end
  end

  def png_name(for_file, version_name)
    %(#{version_name}_#{for_file.chomp(File.extname(for_file))}.png)
  end

  version :thumb do
    process thumbnail: [{ format: 'png', quality: 10, size: 64, square: true, strip: false, logger: Rails.logger }]

    def full_filename(for_file)
      png_name for_file, version_name
    end
  end

  version :tiny do
    process thumbnail: [{ format: 'png', quality: 10, size: 128, square: true, strip: false, logger: Rails.logger }]

    def full_filename(for_file)
      png_name for_file, version_name
    end
  end

  # def png_name for_file, version_name, format
  #   %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.#{format}}
  # end
  ##################################
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w[mp4 mov]
  end

  def move_to_store
    true
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  private

  def test_upload_path
    Rails.root.join / 'spec' / 'uploads' / model.class.to_s.underscore / mounted_as.to_s / model.id.to_s
  end
end
