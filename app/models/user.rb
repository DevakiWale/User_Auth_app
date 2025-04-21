class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         ROLES = %w[admin teacher student]
         
          


  def admin?
    role == "admin"
  end

  def teacher?
    role == "teacher"
  end

  def student?
    role == "student"
  end

  has_one_attached :avatar

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile


end
