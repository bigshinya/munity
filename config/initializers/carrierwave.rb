CarrierWave.configure do |config|
  if Rails.env.production? 
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.s3_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.s3_secret_access_key,
      :region                 => 'ap-southeast-1'
    }

    config.fog_directory = Rails.application.secrets.s3_bucket_name
    # config.fog_host = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  else

    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.dev_s3_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.dev_s3_secret_access_key,
      :region                 => 'ap-southeast-1' #,
    }

    config.fog_directory = Rails.application.secrets.dev_s3_bucket_name
    config.asset_host = "https://s3-ap-southeast-1.amazonaws.com/#{Rails.application.secrets.dev_s3_bucket_name}"
  end 

  # config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
  
end
