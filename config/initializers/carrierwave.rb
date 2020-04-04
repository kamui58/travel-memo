require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.AWS[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.AWS[:secret_access_key],
    region: 'ap-northeast-1',
    path_style: true
  }

  config.fog_directory  = 'travel-memo2020'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/travel-memo2020'
end