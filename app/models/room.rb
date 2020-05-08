class Room < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :users, through: :players

  accepts_nested_attributes_for :players

  def user_has_joined?(user)
    user_ids.include?(user.id)
  end
end
