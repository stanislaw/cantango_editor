# CantangoEditor

Cantango Editor is a Rails Mountable Engine providing ??? for any Rails 3 app. 
It was created as ... to accompany [CanTango gem](https://github.com/kristianmandrup/cantango) initial installiation and usage. Intended to be very easy to setup & use.

## Installiation

### Prerequisites

CantangoEditor assumes that you're on Rails 3.1 and using [CanTango gem](https://github.com/kristianmandrup/cantango) with [Permission engine enabled](https://github.com/kristianmandrup/cantango/wiki/Permission-engine) 

### Not a Gem yet

include in Gemfile:

```ruby
gem 'cantango_editor', :git => "git://github.com/stanislaw/cantango_editor.git"
bundle update
```

### Set up valid ??? you're gonna have in your app

Create file simple_roles.rb in config/initializers and write there:

```ruby
# .rb
```

### And mount CantangoEditor somewhere in your app: 

```ruby
# YOUR_APP's root/config/routes.rb

mount CantangoEditor::Engine => "/cantango_editor"
```

## Todo:

- Write role groups part
- Provide some more config options
- More and better tests
