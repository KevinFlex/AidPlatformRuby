class ApplicationController < ActionController::API


    def encode_token(payload)
      JWT.encode(payload, 'yourSecret')
    #   (in production this should an ENV variable.)

    end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def logged_in_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in?
      !!logged_in_user
    #   returns true if logged in
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end

# ex appropriate request
# fetch("/", {
#   method: "post",
#   headers: {
#     "Content-Type": "application/json",
#     Authorization: `bearer ${JWT_TOKEN}`,
#   },
#   body: JSON.stringify(requestBody),
# })
