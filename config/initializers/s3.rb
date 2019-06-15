require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIATOXUV5QPAZUPBQOH",
      :aws_secret_access_key  => "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",
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "nearclick"
end