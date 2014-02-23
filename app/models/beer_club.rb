class BeerClub < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  
  scope :confirmed

  def member?(user)
    members.include? user
  end
  
  def confirmed_members
  	memberships.select { |m| m.active? }.map { |m| m.user }
  end
  
  def unconfirmed_memberships
  	memberships.select { |m| !m.active? }
  end
  	
end
