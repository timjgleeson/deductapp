class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :username, :user_id, :time_zone
  # attr_accessible :title, :body

  validates :username, :uniqueness => true

  has_many :deductions
  has_many :additions
  has_and_belongs_to_many :budgets
  has_many :favourites
end
