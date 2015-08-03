class ProfilesController < ApplicationController
	before_action :authenticate_user!  
	respond_to :html, :xml, :json

	def index
		@user = current_user
		@profile =Profile.find_by_user_id(@user.id)
	  	respond_with(@profile)
	end

	def show
	  @user = current_user
	  @profile = Profile.find_by_user_id(@user.id)
	  respond_with(@profile)
	end

	def new
	  @profile = Profile.new
	  respond_with(@profile)
	end

	def create
	    @user = current_user
	    @profile =Profile.find_by_user_id(@user.id)
	    if @profile.present?	    		
	    	respond_with(@profile)
	    else 
	    	@profile = @user.build_profile(profile_params)
	    	@profile.save
	    	respond_with(@profile)   	
	    end
	    

  	end

  	private
	    def set_post
	      @profile = Profile.find(params[:id])
	    end

	    def profile_params
	      params.require(:profile).permit(:name, :birthday, :sex, :tel, :address)
	    end
end
