class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def create
    @member = Member.create(
      given_name: member_params[:given_name],
      family_name: member_params[:family_name],
      family: Family.where(member_params[:family_id])
    )
  end

  private

  def member_params
    params.require(given_name:, family_name:, family_id:)
  end
end
