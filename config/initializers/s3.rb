require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "access key here",
      :aws_secret_access_key  => "access secret key here",
      :region                 => 'region here' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "directory here"
end