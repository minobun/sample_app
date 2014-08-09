# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file=Rails.root.join('.secret')
	if File.exist?(token_file)
		#use the existing token
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file
		token  = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end


SampleApp::Application.config.secret_key_base = 'a4f323d393aa6aa3c305eb4e630b25c11b44078b02f95f0b7b0886737c5c78984309c8fc4a5d1cc8ac1e6487e3e39b13d2c92a2141eb681b72a89424049b5675'
