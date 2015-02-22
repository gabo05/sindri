# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#css
Rails.application.config.assets.precompile += %w( lib/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( lib/bootstrap-theme.min.css )
Rails.application.config.assets.precompile += %w( lib/bootstrap-switch.min.css )
Rails.application.config.assets.precompile += %w( lib/bootstrap-datetimepicker.min.css )
Rails.application.config.assets.precompile += %w( unsignup.css )
Rails.application.config.assets.precompile += %w( scheldule.css )
Rails.application.config.assets.precompile += %w( lib/gantt.css )
Rails.application.config.assets.precompile += %w( client.css )

#js
Rails.application.config.assets.precompile += %w( lib/jquery.min.js )
Rails.application.config.assets.precompile += %w( lib/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( lib/bootstrap-switch.min.js )
Rails.application.config.assets.precompile += %w( lib/moment.min.js )
Rails.application.config.assets.precompile += %w( lib/bootstrap-datetimepicker.min.js )
Rails.application.config.assets.precompile += %w( lib/jquery.fn.gantt.js )
Rails.application.config.assets.precompile += %w( lib/handlebars.js )
Rails.application.config.assets.precompile += %w( agent.js )
Rails.application.config.assets.precompile += %w( scheldule.js )
Rails.application.config.assets.precompile += %w( setting.js )
Rails.application.config.assets.precompile += %w( image_upload.js )
Rails.application.config.assets.precompile += %w( solution.js )
