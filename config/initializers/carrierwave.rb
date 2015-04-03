CarrierWave.configure do |config|
  if Rails.env.production? 
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.s3_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.s3_secret_access_key,
      :region                 => 'ap-southeast-1'
    }

    config.fog_directory = 'munity'
  else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.dev_s3_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.dev_s3_secret_access_key,
      :region                 => 'ap-southeast-1'
    }

    config.fog_directory = 'dev-munity'
  end 

end
