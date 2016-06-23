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

temp_bss = BSSWizard::BSS.new("prod")
puts temp_bss.get_initialized_sim("9999105952506")
```


## For development

    $ git clone ssh://git@code.amaysim.net:7999/aweb/bss-wizard.git
    $ cd bss-wizard
    $ bundle install

#### To run tests

    $ bundle exec rake
