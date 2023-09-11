class PanicController < ApplicationController
    def index
      # further claims/authorization checks
      roles = []
      if request.env['jwt.payload'] && request.env['jwt.payload']['roles']
        roles = request.env['jwt.payload']['roles']
      end
      if (roles & ['teller']).empty?
        render json: { message: "You must be a teller for this action." }.to_json, status: :unauthorized
        return
      end

      if request.method == :post
        render json: { message: "Only POST method is supported." }.to_json, status: :unauthorized
        return
      end

      render json: { message: "We've called the police!" }.to_json, status: :ok
    end
  end