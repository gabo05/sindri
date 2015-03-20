# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#css
#Libraries
Rails.application.config.assets.precompile += %w( lib/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( lib/bootstrap-theme.min.css )
#Template
Rails.application.config.assets.precompile += %w( template/blue-theme.css )
Rails.application.config.assets.precompile += %w( template/bootstrap-reset.css )
Rails.application.config.assets.precompile += %w( template/bucket-ico-fonts.css )
Rails.application.config.assets.precompile += %w( template/calendar.css )
Rails.application.config.assets.precompile += %w( template/invoice-print.css )
Rails.application.config.assets.precompile += %w( template/style-responsive.css )
Rails.application.config.assets.precompile += %w( template/style.css )
Rails.application.config.assets.precompile += %w( template/table-responsive.css )
#Fonts
Rails.application.config.assets.precompile += %w( font/css/font-awesome.css )
Rails.application.config.assets.precompile += %w( font/fonts/fontawesome-webfont.eot )
Rails.application.config.assets.precompile += %w( font/fonts/fontawesome-webfont.svg )
Rails.application.config.assets.precompile += %w( font/fonts/fontawesome-webfont.ttf )
Rails.application.config.assets.precompile += %w( font/fonts/fontawesome-webfont.woff )
Rails.application.config.assets.precompile += %w( font/fonts/FontAwesome.otf )
#Pluggins
Rails.application.config.assets.precompile += %w( lib/bootstrap-switch.min.css )
Rails.application.config.assets.precompile += %w( lib/bootstrap-datetimepicker.min.css )
Rails.application.config.assets.precompile += %w( lib/gantt.css )
Rails.application.config.assets.precompile += %w( lib/jquery.minicolors.css )
Rails.application.config.assets.precompile += %w( lib/jquery.steps.css )
Rails.application.config.assets.precompile += %w( lib/soueidan-sidenav.css )
Rails.application.config.assets.precompile += %w( lib/jquery-ui.custom.css )
Rails.application.config.assets.precompile += %w( lib/icheck-blue.css )
#Views
Rails.application.config.assets.precompile += %w( unsignup.css )
Rails.application.config.assets.precompile += %w( scheldule.css )
Rails.application.config.assets.precompile += %w( client.css )
Rails.application.config.assets.precompile += %w( ticket.css )

#js
#Libraries
Rails.application.config.assets.precompile += %w( lib/jquery.min.js )
Rails.application.config.assets.precompile += %w( lib/moment.min.js )
Rails.application.config.assets.precompile += %w( lib/handlebars.js )
Rails.application.config.assets.precompile += %w( lib/bootstrap.min.js )
#Bootstrap Pluggins
Rails.application.config.assets.precompile += %w( lib/bootstrap-switch.min.js )
Rails.application.config.assets.precompile += %w( lib/bootstrap-datetimepicker.min.js )
#JQuery Pluggins
Rails.application.config.assets.precompile += %w( lib/jquery.fn.gantt.js )
Rails.application.config.assets.precompile += %w( lib/jquery.steps.min.js )
Rails.application.config.assets.precompile += %w( lib/jquery.minicolors.min.js )
Rails.application.config.assets.precompile += %w( lib/jquery.table.min.js )
Rails.application.config.assets.precompile += %w( lib/jquery-ui.custom.min.js )
Rails.application.config.assets.precompile += %w( lib/jquery.accordion.js )
Rails.application.config.assets.precompile += %w( lib/jquery.nicescroll.js )
Rails.application.config.assets.precompile += %w( lib/dashboard.js )
Rails.application.config.assets.precompile += %w( lib/jquery.cselect.min.js )
Rails.application.config.assets.precompile += %w( lib/jquery.icheck.min.js )
Rails.application.config.assets.precompile += %w( lib/scripts.js )
#Controllers Scripts
Rails.application.config.assets.precompile += %w( form.ajax.js )
Rails.application.config.assets.precompile += %w( common.js )
Rails.application.config.assets.precompile += %w( agent.js )
Rails.application.config.assets.precompile += %w( client.js )
Rails.application.config.assets.precompile += %w( catalog.js )
Rails.application.config.assets.precompile += %w( scheldule.js )
Rails.application.config.assets.precompile += %w( setting.js )
Rails.application.config.assets.precompile += %w( image_upload.js )
Rails.application.config.assets.precompile += %w( solution.js )
Rails.application.config.assets.precompile += %w( home.js )
Rails.application.config.assets.precompile += %w( unsignup.js )
Rails.application.config.assets.precompile += %w( register.js )
Rails.application.config.assets.precompile += %w( report.js )
Rails.application.config.assets.precompile += %w( ticket.js )
Rails.application.config.assets.precompile += %w( business.js )

#Sources
#jQuery Gantt http://taitems.github.io/jQuery.Gantt/
#Bootstrap Switch http://www.bootstrap-switch.org/
#moment.js http://momentjs.com/
#Bootstrap Datepicker http://eonasdan.github.io/bootstrap-datetimepicker/
#jQuery Steps http://www.jquery-steps.com/GettingStarted
#Bootstrap Minicolors http://labs.abeautifulsite.net/jquery-minicolors/#download
#jQuery Validator http://jqueryvalidation.org/