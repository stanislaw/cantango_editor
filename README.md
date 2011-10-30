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

To understand Cantango's permission_engine's options better please see: [](https://github.com/kristianmandrup/cantango/wiki/Permissions)

Create file cantango_editor.rb in config/initializers and write there: 

```ruby
# Your_app's root/config/initializers/cantango_editor.rb
CantangoEditor.configure do |config|

  # default: [:user_types, :account_types, :roles, :role_groups, :licenses, :users]
  config.permission_types_available = [:roles, :role_groups] 
  
  # default: { :roles => [:admin, :user] }
  config.permission_groups_available = { :roles => [:guest, :user],
  :user_types => [:admin] }

  # default: all Models extracted from ActiveRecord's tables list
  config.models_available = config.models_default - [Admin, CustomSession]

  # default: [:create, :read, :update, :delete, :manage]
  config.actions_available = config.actions_default | [:write,
  :assign_roles]
end

```

### And mount CantangoEditor somewhere in your app: 

```ruby
# Your_app's root/config/routes.rb

mount CantangoEditor::Engine => "/cantango_editor"
```

## Todo:

- More and better tests
