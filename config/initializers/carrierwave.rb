CarrierWave.configure do |config|
  if Rails.env.production? 
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV["S3_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV["S3_SECRET_ACCESS_KEY"],
      :region                 => 'ap-southeast-1'
    }

    config.fog_directory = ENV["S3_BUCKET_NAME"]
    config.asset_host = "https://s3-ap-southeast-1.amazonaws.com/#{ENV["S3_BUCKET_NAME"]}"
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
