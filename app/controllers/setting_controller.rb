class SettingController < ApplicationController
    def index
    end
    def first
    	@categories = Category.where('is_suggested=(1)::bit(1) and state=(1)::bit(1)')
    	@areas = Area.where('is_suggested=(1)::bit(1) and state=(1)::bit(1)')
    end
    def update
    end
end
