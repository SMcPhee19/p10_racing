require 'json'
require 'base64'
require 'OpenSSL'

class JwtService
  def create_token(user: User)
      pidalg = "HS256"
      pidorg = "aaaaaaaa-a1b2-123a-b456-1234abcd5678"
      pidtok = "c9fed74c5c994509b849ff65adb367d1"
      
      timestamp = Time.now.utc.strftime("%Y-%m-%d %H:%M:%S.000")
      pidkey = "JWC41crr322aUfdckVfJKHvGKNIPyAPGL7rMsTbzHlA="

      #jwt header
      jwtheader = {
          "alg": pidalg,
          "org_alias": pidorg,
          "token": pidtok
      }

      # claims = SELECT name FROM UserClaims uc INNER JOIN users_x_userclaims uxuc ON uc.user_id = uxuc.user_id WHERE uxuc.user_id = user.user_id
      claims = UserClaim.joins("INNER JOIN users_x_userclaims ON users_x_userclaims.userclaim_id = userclaims.id").where(users_x_userclaims: { userclaim_id: user.id }).pluck(:name)
      require 'pry'; binding.pry


      
      
      #jwt payload
      jwtpayload = {
          "reqHeader":{
              "locale":"en",
              "orgAlias":pidorg,
              "secretKey":pidtok,
              "timestamp":timestamp,
              "version":"4.6"
          },
          "reqBody":{
              "userName":user.username,
              "userClaims":claims,
          }
      }

      jwtheaderJSON = jwtheader.to_json
      jwtheaderUTF = jwtheaderJSON.encode("UTF-8")
      tokenheader = Base64.urlsafe_encode64(jwtheaderUTF)
      puts tokenheader

      jwtpayloadJSON = jwtpayload.to_json
      jwtpayloadUTF = jwtpayloadJSON.encode("UTF-8")
      tokenpayload = Base64.urlsafe_encode64(jwtpayloadUTF)
      puts tokenpayload

      signeddata = tokenheader + "." + tokenpayload

      digest = OpenSSL::Digest.new('sha256')
      bin_key = Base64.decode64(pidkey)
      instance = OpenSSL::HMAC.digest(digest, bin_key, signeddata)
      signature = Base64.urlsafe_encode64(instance).chomp[0...-1]
      puts signature

      apitoken = signeddata + "." + signature

      puts apitoken
  end
end