class FamilyMemberSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  belongs_to :family
end
