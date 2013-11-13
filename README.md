OmniAuth Trademe
==============

This gem contains the Trademe strategy for OmniAuth.

For more information about the Trademe api: http://developers.trademe.co.nz/

How To Use It
-------------

If you are using rails, you need to add the gem to your `Gemfile`:

    gem 'omniauth-trademe'

You can pull them in directly from github e.g.:

    gem "omniauth-trademe", :git => "git://github.com/eadz/omniauth-trademe.git"

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
    	provider :trademe, 'consumer_key', 'consumer_secret'
    	provider :trademe_sandbox, 'consumer_key', 'consumer_secret' unless Rails.env.production?
    end

User the name of the class as provider(trademe), however to authorize, you should use the provider name which is 'trademe'.


You will obviously have to put in your key and secret, which you can get from my trademe -> my applications


After you have the gem running and the configuration is done, you can get to the follow url to log the user in:

	http://localhost:3000/auth/trademe

Now just follow the README at: https://github.com/intridea/omniauth

Questions
---------

For any question, fell free to send me a tweet http://twitter.com/eadz

License
-------

Copyright (c) 2011 by Eaden McKee ( Author ), Arthur Neves ( Author of the 500px omniauth strategy which this strategy has been modeled on)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.