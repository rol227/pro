class GroupsController < ApplicationController
	before_action :current_user, only: [:show, :new, :create, :destroy]
	before_action :find_graph, only: [:index]

	def index
		@group = Group.offset(rand(Group.count)).first 
	end

	def show
		@group = Group.find(params[:id])
	end

	def new
		@group = current_user.groups.new
	end

	def create
		@group = current_user.groups.create(group_params)

		if @group.save
			redirect_to groups_path
		else
			redirect_to groups_path
		end
	end

	def destroy
		@group = Group.find(parmas[:id])
		@group.destroy

		redirect_to groups_path
		#have their old groups destroy upon creating a new one
		#the .first_or_create method might come in handy
	end

	private

	def group_params
		params.require(:group).permit(:name, :user_id)
	end

	def find_graph
		@graph = Koala::Facebook::API.new(session[:token])
	end
end
