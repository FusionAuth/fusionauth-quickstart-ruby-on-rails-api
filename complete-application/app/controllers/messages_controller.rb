class MessagesController < ApplicationController
    def index
      messages = []
      messages << "Hello"
  
      # further claims/authorization checks
      roles = []
      if request.env['jwt.payload'] && request.env['jwt.payload']['roles']
        roles = request.env['jwt.payload']['roles']
      end
      if roles.include?('teller') 
        messages << "Teller"
      end
      render json: { messages: messages }.to_json, status: :ok
    end
  end