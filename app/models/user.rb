class User < ApplicationRecord
  #temporarily store them, but not to the database
  # attr_accessor :password, :password_confirmation

  #move info about has secure password... just Google it.
  #has_secure_password automatically adds attribute accessor for
  #password and password_confirmation.
  # it requires the BCrypt gem and it automatically hashes the password
  # and stores it in the password_digest field.
  # It adds a presence validation to the password.
  # If password_confirmation is provided then it makes sure that it's the same
  # as the password
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX


  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

  has_many :questions, dependent: :nullify

  after_initialize :set_defaults

  private

  def set_defaults

    self.admin ||= false
  end


end
