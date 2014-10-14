CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
    config.enable_processing = true
  else
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'] || "",
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || "",
      region: 'us-east-1'
      #host: 's3-website-us-east-1.amazonaws.com',
      #endpoint: 'https://study.drill.do-production.s3-website-us-east-1.amazonaws.com'
    }

    config.fog_directory = ENV['S3_BUCKET']
    config.fog_host = "https://study.drill.do-production.s3-website-us-east-1.amazonaws.com/#{ENV['S3_BUCKET']}"
    config.fog_public = true
    config.storage = :fog
  end
end
