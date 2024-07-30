# OmniAuth Roblox

OmniAuth Roblox is an OAuth2 strategy for OmniAuth that allows you to authenticate users using Roblox. If you're not familiar with Roblox's OAuth2, we recommend you check out the [Roblox API documentation](https://create.roblox.com/docs/cloud/open-cloud/oauth2-overview) for more details.

## Installation

Install the gem and add to the application's Gemfile by running the following command:

```bash
$ bundle add omniauth-roblox --git=https://github.com/super-dimension-studios/omniauth-roblox
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
$ gem install omniauth-roblox -s https://github.com/super-dimension-studios/omniauth-roblox
```

## Usage

OmniAuth Roblox is a Rack middleware. If you're not familiar with OmniAuth, we recommend reading the documentation for detailed instructions. Here's an example of how to add the middleware to a Rails app in config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :roblox, Rails.application.credentials.oauth.roblox.id, Rails.application.credentials.oauth.roblox.secret
end
```

By default, Roblox does not return a user's email address. You can request access to additional resources by setting scopes. For example, to get a user's email, you would set the scope to ''.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :roblox, Rails.application.credentials.oauth.roblox.id, Rails.application.credentials.oauth.roblox.secret, scope: 'email'
end
```

You can pass multiple scopes in the same string. For example, to get a user's Roblox account info, you would set the scope to 'openid profile'.


```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :roblox, Rails.application.credentials.oauth.roblox.id, Rails.application.credentials.oauth.roblox.secret, scope: 'openid profile'
end
```

You can also specify a callback URL by adding callback_url to the provider options.


```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :roblox, Rails.application.credentials.oauth.roblox.id, Rails.application.credentials.oauth.roblox.secret, scope: 'openid profile', callback_url: 'https://someurl.com/users/auth/discord/callback'
end
```

## Prompt Options

You can specify the prompt options by setting the prompt option. The prompt option indicates whether the user should be prompted to reauthorize on sign in. Valid options are 'consent' and 'none'. Note that the user is always prompted to authorize on sign up.

## Contributing

If you find a bug or want to contribute to the project, we welcome bug reports and pull requests on GitHub.


## License

OmniAuth Roblox is available as open-source software under the [MIT License](http://opensource.org/licenses/MIT).
