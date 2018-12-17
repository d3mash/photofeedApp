# frozen_string_literal: true

# module AuthHelper
#   def authenticated?(attribute, token)
#     digest = send("#{attribute}_digest")
#     return false unless digest

#     BCrypt::Password.new(digest).is_password?(token)
#   end

#   def new_token
#     SecureRandom.urlsafe_base64
#   end

#   def remember(user)
#     remember_token = new_token
#     perm = cookies.permanent
#     perm.signed[:user_id] = user.id
#     perm[:remember_token] = user.remember_token
#     user.update(remember_digest: User.digest(remember_token))
#   end

#   def forget(user)
#     cookies.delete(:user_id)
#     cookies.delete(:remember_token)
#     user.update(remember_digest: User.digest(new_token))
#   end

#   def send_activation_email(user)
#     UserMailer.account_activation(user).deliver_now
#   end

#   def activate(user)
#     user.update(activated: true, activated_at: Time.zone.now)
#   end

#   def create_activation_digest(user)
#     user.activation_digest = User.digest(new_token)
#   end
# end
