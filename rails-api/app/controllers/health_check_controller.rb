class HealthCheckController < ApplicationController
  def ping
    render status: 200, json: {"message": "pong"}.to_json
  end
end
