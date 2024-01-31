# frozen_string_literal: true

require 'json'
require 'base64'
require 'OpenSSL'

class JwtService
  def create_token(user: User)
    pidalg = 'HS256'

    timestamp = Time.now.utc.strftime('%Y-%m-%d %H:%M:%S.000')
    pidkey = 'JWC41crr322aUfdckVfJKHvGKNIPyAPGL7rMsTbzHlA='
    hmac_secret = 'imAs3cret!'

    # jwt header
    jwtheader = {
      "alg": pidalg,
      "typ": 'JWT'
    }

    claims = UserClaim.joins('INNER JOIN user_claims_users ON user_claims_users.user_claim_id = user_claims.id').where(user_claims_users: { user_claim_id: user.id }).pluck(:name)
    require 'pry'
    binding.pry

    # jwt payload
    jwtpayload = {
      "reqHeader": {
        "locale": 'en',
        "timestamp": timestamp,
        "version": '1.0'
      },
      "reqBody": {
        "userName": user.username,
        "userClaims": claims
      }
    }
    test_token = JWT.encode jwtpayload, hmac_secret, 'HS256'
    puts test_token
  end

  def decode(token: String)
    JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
  end
end
