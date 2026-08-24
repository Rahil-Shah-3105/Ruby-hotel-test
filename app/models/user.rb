class User < ApplicationRecord
logger           = ActiveSupport::Logger.new(STDOUT)
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :apartments
  has_many :orders
  has_many :help_requests

  validates :first_name, :last_name, presence: true,
                                     format: { with: /\A[A-Z].*\z/, message: 'Please, start from upper case' }
  validates :email, uniqueness: true,
                    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
                    presence: { message: 'Please, fill the field with correct email' }
  validates :phone, uniqueness: true

  devise :database_authenticatable, :registerable, :recoverable

  def full_name
	warn("[DEBUG] >>> Entering full_name()")
	warn("[DEBUG] <<< Exiting full_name()")
    "#{last_name} #{first_name}"
  end

  def self.from_omniauth(auth)
	warn("[DEBUG] >>> Entering from_omniauth(auth=#{auth})")
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider =   auth.provider
	warn("[DEBUG] from_omniauth(auth=#{auth}): user.provider → #{user.provider}")
	warn("[DEBUG] from_omniauth(auth=#{auth}): user.uid → #{user.uid}")
	warn("[DEBUG] from_omniauth(auth=#{auth}): user.first_name → #{user.first_name}")
	warn("[DEBUG] from_omniauth(auth=#{auth}): user.last_name → #{user.last_name}")
	warn("[DEBUG] from_omniauth(auth=#{auth}): user.email → #{user.email}")
      user.uid =        auth.uid
      user.first_name = auth.extra.raw_info.first_name
      user.last_name =  auth.extra.raw_info.last_name
      user.email =      auth.extra.raw_info.email
      user.gender =     auth.extra.raw_info.gender == 'male' ? 1 : 0
	warn("[DEBUG] from_omniauth(auth=#{auth}): user.password → #{user.password}")
      user.password = Devise.friendly_token[0, 20]
	warn("[DEBUG] <<< Exiting from_omniauth(auth=#{auth})")
    end
  end
end
