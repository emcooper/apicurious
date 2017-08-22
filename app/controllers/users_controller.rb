class UsersController < ApplicationController

  def show
    @user = current_user
    # @conn = Faraday.new(url: "https://api.github.com") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV["propublica-key"]
    #   faraday.adapter Faraday.default_adapter
    # end
    response = Faraday.get("https://api.github.com/users/#{@user.username}") if @user
    attributes = JSON.parse(response.body, symbolize_names: :true)
    @user = User.new(attributes)
  end

end
