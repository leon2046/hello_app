require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HelloApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
    I18n.available_locales = %i(ja en)
    I18n.enforce_available_locales = true
    I18n.default_locale = :ja
  end
end
