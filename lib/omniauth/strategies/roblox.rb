require 'omniauth-oauth2'

module OmniAuth
	module Strategies
		class Roblox < OmniAuth::Strategies::OAuth2
			DEFAULT_SCOPE = 'openid profile'.freeze

			option :name, 'roblox'
			option :client_options,
				site: 'https://apis.roblox.com/oauth/v1/',
				authorize_url: 'authorize',
				token_url: 'token'
			option :authorize_options, %i[scope consent login selectAccount]

			uid { raw_info['sub'] }

			info do
				{
					name: raw_info['name'],
					nickname: raw_info['nickname'],
					email: raw_info['verified'] ? raw_info['email'] : nil,
					image: raw_info['picture']
				}
			end

			extra do
				{
					raw_info: raw_info
				}
			end

			def raw_info
				@raw_info ||= access_token.get('userinfo').parsed
			end

			def callback_url
				# Roblox does not support query parameters
				options[:redirect_uri] || (full_host + script_name + callback_path)
			end

			def authorize_params
				super.tap do |params|
					options[:authorize_options].each do |option|
						params[option] = request.params[option.to_s] if request.params[option.to_s]
					end
					params[:scope] ||= DEFAULT_SCOPE
				end
			end
		end
	end
end
