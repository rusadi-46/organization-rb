class OrganizationController < ApplicationController
	before_action :user_is_logged_in
	def index
		@organization = Organization.all
		if params[:search]
		    @organization = Organization.search(params[:search]).order("created_at DESC")
		else
		    @organization = Organization.all.order('created_at DESC')
		end
	end
	def new
		@user = User.all
	end
	def create
   		@organization = Organization.create(params.require(:organization).permit(:user_id, :name, :email, :phone, :website, :organization_id, :logo))

   		if @organization.save
	      	redirect_to organization_index_url, notice: "Success add new data"
	    else
	      	render "new"
	    end
  	end

  	def edit
		@user = User.all
  	    @organization = Organization.find(params[:id])
    end

    def update
    	@organization = Organization.find(params[:id])
        if @organization.update(params.require(:organization).permit(:user_id, :name, :email, :phone, :website, :organization_id, :logo))
        	redirect_to organization_index_url, notice: "Success update data"
    	else
      		render 'edit'
    	end
    end

    def show
  	    @organization = Organization.find(params[:id])
    end

    def destroy
    	Organization.destroy(params[:id])
    	redirect_to organization_index_url, notice: "Success delete data"
    end
end
