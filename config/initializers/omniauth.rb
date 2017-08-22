Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["github-key"], ENV["github-secret"]
end
