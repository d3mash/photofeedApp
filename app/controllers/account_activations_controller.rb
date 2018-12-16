# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  include ActivationServices
  def edit
    if try_activate(params)
      flash[:success] = 'Account activated'
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
