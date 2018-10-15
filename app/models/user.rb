class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, :role

  def admin? 
    role == "admin"
  end

  def super_admin?
    role == "super_admin"
  end

  def member?
    role == "member"
  end
end
