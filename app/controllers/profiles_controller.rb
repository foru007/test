class ProfilesController < ApplicationController
	before_action :authenticate_user!  
	respond_to :html, :xml, :json

	def index
		@user = current_user
		@profile =Profile.find_by_user_id(@user.id)
	  	respond_with(@profile)
	end

	def show
	  @profile = Profile.find_by_user_id(params[:id])
	  respond_with(@profile)
	end

	def new
	  @profile = Profile.new
	  respond_with(@profile)
	end 

	def edit
		@profile = Profile.find_by_user_id(params[:id])
	  	respond_with(@profile)
  	end

	def update
		@user = current_user
		@profile = Profile.find(params[:id])
	    @profile.update(update_params)
	    redirect_to profile_path(@user.id)
	end

	def create
	    @user = current_user
	    @profile =Profile.find_by_user_id(@user.id)
	    if @profile.present?	    		
	    	respond_with(@profile)
	    else 
	    	@profile = @user.build_profile(profile_params)
	    	@profile.save
	    	redirect_to profile_path(@profile.user.id) 

	    end
	    

  	end

  	private
	    def set_post
	      @profile = Profile.find(params[:id])
	    end
	    def update_params
	      params.require(:profile).permit(:name, :birthday, :sex, :tel, :address, :photo)
	    end
	    def profile_params
	      params.require(:profile).permit(:name, :birthday, :sex, :tel, :address, :photo)
	    end
end
