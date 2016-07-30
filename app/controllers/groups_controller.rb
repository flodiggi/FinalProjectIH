class GroupsController < ApplicationController

 def create
  group = Group.new(group_params)

    if
    group.name.blank?
    redirect_to("/profile")
    else
    group.users << current_user
    group.save
    redirect_to ("/profile")
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
