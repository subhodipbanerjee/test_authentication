class Api::UsersController < ApplicationController
	respond_to :json

	def create
		debugger
		user = User.new({:email => params[:email], :password => params[:password]})
		app = Doorkeeper::Application.find_by(uid: params[:client_id], secret: params[:client_secret])
		if app
			if user.save
				render json: { success: true, message: 'Registration complete.' }, status: 200
			end
		else
			render json: { success: false, message: 'Unauthorized.' }, status: 401
		end
	end

end