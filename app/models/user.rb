class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attr_writer :login

  # Let the user login with the username or the email
  def login
    @login || self.username || self.email
  end

  # Overriding default find_for_database_authentication method
  def self.find_for_database_authentication(warden_conditions)

      conditions = warden_conditions.dup

      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first

      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first

      end
    end

  # Validations and associations
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
