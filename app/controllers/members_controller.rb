class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def create
  end
end
