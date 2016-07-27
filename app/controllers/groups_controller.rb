class GroupsController < ApplicationController

 def create
  group = Group.new(group_params)

    if
    group.name =~ /^$/
    # || activity.participants =~ /^$/
    redirect_to("/profile")
    else
    group.users << current_user
    group.save
    redirect_to ("/profile")
    end
  end
end
