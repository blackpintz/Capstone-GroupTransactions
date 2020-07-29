class GroupsController < ApplicationController
    def new
    end
    
    def create
        new_group = current_user.categories.build(group_params)
        if new_group.save
            flash[:notice] = 'You successfully created a new category.'
            redirect_to groups_path
        else
            render 'new'
        end
    end
    
    def index
        @groups = Group.all
    end
    
  private
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
