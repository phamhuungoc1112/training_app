class ApplicationController < ActionController::Base
    def hello
    end
    include SessionsHelper
end
