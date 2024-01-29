# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_seasons
  has_many :seasons, through: :user_seasons
  has_many :user_picks
  
  has_many :users_x_userclaims
  has_many :user_claims, through: :users_x_userclaims

  validates :name, presence: true

  # def calculate_total_points
  #   sum = 0

  #   user_picks.each do |user_pick|
  #     sum += user_pick.points_earned
  #   end
  #   update(total_points: sum)
  # end

  def validate_user_password(password_string)
    calculated_hash = calculate_hash(password_string)
    true if pw_hash == calculated_hash
  end

  def update_user_password(password)
    validation_results = validate_user_password_requirements(password)
    # If the pw failed validation, return failure with reasons. Otherwise, return true
    return false if validation_results.length > 1

    save_new_password(password)
    true
  end

  def validate_user_password_requirements(password_string)
    errMessages = []

    # Make sure pw meets min length requirements
    errMessages.push('Password must be at least 6 characters in length') if password_string.length < 6

    # Make sure pw meets max length requirements
    errMessages.push('Password must be less than 30 characters in length') if password_string.length > 30

    # Make sure pw contains at least 1 special character
    if password_string !~ /.*[$&+,:;=?@#|'<>.-^*()%!]+.*/
      errMessages.push('Password must contain at least 1 special character')
    end

    # Make sure pw contains at least 1 number
    errMessages.push('Password must contain at least 1 number') if password_string !~ /.*[0-9]+.*/

    # Make sure pw contains at least 1 capital letter
    errMessages.push('Password must contain at least 1 capital letter') if password_string !~ /.*[A-Z]+.*/

    # Make sure pw contains at least 1 lower case letter
    errMessages.push('Password must contain at least 1 lower case letter') if password_string !~ /.*[a-z]+.*/

    errMessages
  end

  def sign_in_user() # should the arguments be the password_string and pw_salt?
   # start calling methods below
  end

  private

  def calculate_hash(password_string)
    hashvalue_raw = get_pw_salt_concat(pw_salt, password_string)
    Digest::MD5.hexdigest(hashvalue_raw)
  end

  # Create a hash and salt for a new user password
  # == Params:
  # password_string::
  def save_new_password(password_string)
    salt = SecureRandom.uuid
    prehash = get_pw_salt_concat(salt, password_string)
    calculated_hash = calculate_hash(prehash)
    update(pw_hash: calculated_hash, pw_salt: salt)
  end

  def get_pw_salt_concat(salt, password)
    "#{salt}&$##{password}"
  end
end
