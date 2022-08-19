class ApplicationController < ActionController::Base
    before_action :today
    def today
        @today = Date.current.strftime("%Y年%m月%d日")
    end

end
