class Api::V1::Families::FamilyMembersController < ApplicationController
  def index
    family = Family.find_by(id: params[:id])
    if family && family.family_members !=[]
      render json: FamilyMemberSerializer.new(family.family_members)
    else
      render json: "You have no family members listed"
    end
  end
end
