class GroupsController < ApplicationController

 def create
  group = Group.new(group_params)
  group.user_id = current_user.id

    if
    group.name.blank?
    redirect_to("/profile")
    else
    group.users << current_user
    group.save
    redirect_to ("/profile")
    end
  end


  def update
    group = Group.find_by(id: params[:id])
    @activity = Activity.find_by(id: params[:actid])
    idarray = group_params[:users]
    idarray.each do |id|
      if id != "0" && group.users.find_by(id: id) == nil
        user = User.find_by(id: id)
        group.users << user
      end
    end
    group.save
    redirect_to ("/activity/#{@activity.id}")
  end


  def deleteuser
    group = Group.find_by(id: params[:id])
    group.users.delete(User.find(params[:userid]))
    redirect_to '/profile'
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :users => [])
  end
end
