# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#css
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-theme.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-switch.min.css )
Rails.application.config.assets.precompile += %w( unsignup.css )
Rails.application.config.assets.precompile += %w( scheldule.css )
Rails.application.config.assets.precompile += %w( gantt.css )

#js
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-switch.min.js )
Rails.application.config.assets.precompile += %w( agent.js )
Rails.application.config.assets.precompile += %w( jquery.fn.gantt.js )
Rails.application.config.assets.precompile += %w( scheldule.js )
Rails.application.config.assets.precompile += %w( setting.js )