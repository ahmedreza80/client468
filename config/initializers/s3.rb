require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAQZ6XZSKKX5NED2U6",
      :aws_secret_access_key  => "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",
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "theddbucket"
end