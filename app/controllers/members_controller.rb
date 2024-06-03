class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def create
    @member = Member
      .includes(:family)
      .create(
        given_name: member_params[:given_name],
        family_name: member_params[:family_name],
        family_id: member_params[:family_id].to_i
      )
  end

  def destroy
    # Refreshing the delete request, puts you in a bad state.
    @member = Member
      .includes(:family)
      .destroy(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    puts "Not found"
  ensure
    # Destroy should yield no content, probably...
    # The problem is that the UI then has to remove the deleted item...
    redirect_back_or_to(members_url)
  end

  private

  def member_params
    params.permit(:given_name, :family_name, :family_id)
  end
end
