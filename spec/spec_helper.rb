require 'rails_helper'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def stub_omniauth
  OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "12345678910",
      info: {
        nickname: "emcooper",
        email: "ellencooper74@gmail.com",
        name: "Ellen Cooper",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQESkVtS1LQoEVN2-zr9ZlOeyndZbRD5DDrYfPnxcCOaOzFUV8w"
      },
      credentials: {
        token: "abcdefg12345",
        expires: false,
      }
    })
end
