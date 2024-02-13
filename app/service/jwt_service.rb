# frozen_string_literal: true

require 'json'
require 'base64'
require 'openssl'

class JwtService # rubocop:disable Style/Documentation
  def initialize
    @hmac_secret = 'imAs3cret!'
  end

  def create_token(user: User) # rubocop:disable Metrics/MethodLength
    'HS256'

    timestamp = Time.now.utc.strftime('%Y-%m-%d %H:%M:%S.000')

    # jwt header

    claims = UserClaim.joins('INNER JOIN user_claims_users ON user_claims_users.user_claim_id = user_claims.id').where(user_claims_users: { user_claim_id: user.id }).pluck(:name) # rubocop:disable Layout/LineLength

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
    JWT.encode jwtpayload, @hmac_secret, 'HS256'
    # puts test_token
  end

  def decode(token)
    JWT.decode token, @hmac_secret, true, { algorithm: 'HS256' }
  end

  def check_for_claim(token, claim)
    decoded = decode(token)
    body = decoded[0]['reqBody']
    claims = body['userClaims']
    return true if claims.include? claim

    false
  end
end
