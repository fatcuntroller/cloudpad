Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :identity,
    :on_failed_registration => IdentitiesController.action(:new)
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}  