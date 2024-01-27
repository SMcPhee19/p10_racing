# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_seasons
  has_many :seasons, through: :user_seasons
  has_many :user_picks

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
    return true if pw_hash == calculated_hash
  end

  def update_user_password(password)
    errors = []
    validation_results = validate_user_password_requirements(password)
    # If the pw failed validation, return failure with reasons. Otherwise, return true
    if (validation_results.length > 1)
      return false
    else
      save_new_password(password)
      return true
    end
  end
  
  def validate_user_password_requirements(password_string)
    errMessages = []
    
    # Make sure pw meets min length requirements
    if (password_string.length < 6)
      errMessages.push('Password must be at least 6 characters in length')
    end
    
    # Make sure pw meets max length requirements
    if (password_string.length > 30)
      errMessages.push('Password must be less than 30 characters in length')
    end

    # Make sure pw contains at least 1 special character
    if (password_string !~ /.*[$&+,:;=?@#|'<>.-^*()%!]+.*/)
      errMessages.push('Password must contain at least 1 special character')
    end
    
    # Make sure pw contains at least 1 number
    if (password_string !~ /.*[0-9]+.*/)
      errMessages.push('Password must contain at least 1 number')
    end
    
    # Make sure pw contains at least 1 capital letter
    if (password_string !~ /.*[A-Z]+.*/)
      errMessages.push('Password must contain at least 1 capital letter')
    end

    # Make sure pw contains at least 1 lower case letter
    if (password_string !~ /.*[a-z]+.*/)
      errMessages.push('Password must contain at least 1 lower case letter')
    end

    return errMessages
  end
  
  private
  
  def calculate_hash(password_string)
    hashvalue_raw = get_pw_salt_concat(pw_salt, password_string)
    hashvalue_raw_calculated = Digest::MD5.hexdigest(hashvalue_raw)
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
    salt + "&$#" + password
  end
end
