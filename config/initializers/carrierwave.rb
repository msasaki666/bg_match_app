require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],# potepanec
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],# potepanec
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'bg-match-app'
  end
end