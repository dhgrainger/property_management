class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def index
    @owners = Owner.all
  end

  def create
    @owner = Owner.new(owner_params)
      if @owner.save
        redirect_to new_owner_path, notice: 'Owner was successfully registered.'
      else
        render action: 'new', notice: "Missing Attributes"
      end
  end

  def destroy
    @owner = Owner.find(params['id'])
    @owner.destroy
    render action: 'new'
  end

  private
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email)
    end
end
