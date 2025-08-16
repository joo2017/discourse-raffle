# name: discourse-raffle
# about: A plugin to create and manage raffles in Discourse.
# version: 0.1
# authors: [Your Name]
# url: [Your Github URL]

enabled_site_setting :raffle_enabled

after_initialize do
  # frozen_string_literal: true

  load File.expand_path('../app/models/raffle.rb', __FILE__)
end
