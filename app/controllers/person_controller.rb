class PersonController < ApplicationController
	before_action :user_is_logged_in
	def index
		@person = Person.all
		if params[:search]
		    @person = Person.search(params[:search]).order("created_at DESC")
		else
		    @person = Person.all.order('created_at DESC')
		end
	end

	def new
		@organization = Organization.all
	end

	def create
   		@person = Person.new(params.require(:person).permit(:organization_id, :name, :email, :phone, :avatar))

   		if @person.save
	      	redirect_to person_index_url
	    else
	      	render "new"
	    end
  	end

  	def edit
		@organization = Organization.all
  	    @person = Person.find(params[:id])
    end

    def update
    	@person = Person.find(params[:id])
        if @person.update(params.require(:person).permit(:organization_id, :name, :email, :phone, :avatar))
        	redirect_to person_index_url, notice: "Success update data"
    	else
      		render 'edit'
    	end
    end

    def destroy
    	Person.destroy(params[:id])
    	redirect_to person_index_url, notice: "Success delete data"
    end

end
