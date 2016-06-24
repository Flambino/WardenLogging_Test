class UnauthorizedController < ActionController::Metal
  include ActionController::Head

  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    head :unauthorized
  end
end