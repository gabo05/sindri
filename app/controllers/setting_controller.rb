class SettingController < ApplicationController
    def index
    end
    def first
    	@categories = Category.where('is_suggested=(1)::bit(1) and state=(1)::bit(1)')
    	@areas = Area.where('is_suggested=(1)::bit(1) and state=(1)::bit(1)')
    	suggested_states = State.where('is_suggested=(1)::bit(1) and state=(1)::bit(1)')
    	ss_count_half = suggested_states.count()/2
    	@suggested_states1 = suggested_states.limit(ss_count_half)
    	@suggested_states2 = suggested_states.offset(ss_count_half).limit(ss_count_half)
    end
    def update
    end
end
