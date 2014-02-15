Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :identity,
    :on_failed_registration => IdentitiesController.action(:new)
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}  