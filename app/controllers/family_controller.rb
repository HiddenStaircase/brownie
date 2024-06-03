class FamilyController < ApplicationController
  def index
    @families = Family.all
  end

  def show
    @family = Family.includes(:members).find(family_params)

    # Include members?
  end

  private

  def family_params
    params.required(:id)
  end
end
