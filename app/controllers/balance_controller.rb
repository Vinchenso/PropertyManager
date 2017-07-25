# frozen_string_literal: true
class BalanceController < ApplicationController
  def import
    p balance_params
  end

  private

  def balance_params
    params
  end

end
