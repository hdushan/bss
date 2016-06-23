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

TestConfig.setup("dev02")
bss = BSSWizard::BSS.new(TestConfig)
puts bss.get_initialized_sim("9999105952506")
```
