# BSS Wizard

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bsswizard', git: 'https://code.amaysim.net/scm/aweb/bss-wizard.git'
```

And then execute:

    $ bundle install


## Usage

```ruby
require 'bsswizard'

bss = BSSWizard::BSS.new("prod") #As long as the string contains 'prod' (case insensitive), it'll point to production, else will point to battlefield
sim = bss.get_initialized_sim("9999105952506") #In Prod, the sim returned will be likely different from what you pass in
```


## For development

    $ git clone ssh://git@code.amaysim.net:7999/aweb/bss-wizard.git
    $ cd bss-wizard
    $ bundle install

#### To run tests

    $ bundle exec rake
