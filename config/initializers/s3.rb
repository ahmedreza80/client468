require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAJKMBIDHAHKX6MHNQ",
      :aws_secret_access_key  => "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 ",
      :region                 => 'ap-south-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "nearclickbucket"
end