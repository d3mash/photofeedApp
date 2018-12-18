# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: not_found

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
