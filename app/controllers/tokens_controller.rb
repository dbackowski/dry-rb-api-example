class TokensController < ApplicationController
  def create
    call_action(create_payment_profile)
  end

  private

  def create_payment_profile
    Actions::CreateToken::Action.new
  end
end
