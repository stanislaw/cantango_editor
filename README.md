# CantangoEditor

Cantango Editor is a Rails mountable Engine providing web-interface for editing [CanTango](https://github.com/kristianmandrup/cantango) gem's permissions for any Rails 3 app.

It is no more than a nice-looking wrapper interface which is used for editing permissions stored in special yaml file.

## Installiation

### Prerequisites

CantangoEditor assumes that you're on Rails 3.1 and using [CanTango gem](https://github.com/kristianmandrup/cantango) with [Permission engine enabled](https://github.com/kristianmandrup/cantango/wiki/Permission-engine) 

### Not a Gem yet

include in Gemfile:

```ruby
gem 'cantango_editor', :git => "git://github.com/stanislaw/cantango_editor.git"
bundle update
```

### Set up models, types, groups and actions you're gonna have in your app

To understand Cantango's permission_engine's options better please see wiki on Cantango's [Permissions](https://github.com/kristianmandrup/cantango/wiki/Permissions).

Create file cantango_editor.rb in config/initializers and write there: 

```ruby
# Your_app's root/config/initializers/cantango_editor.rb
CantangoEditor.configure do |config|

  # default: [:user_types, :account_types, :roles, :role_groups, :licenses, :users]
  config.permission_types_available = [:roles, :role_groups] 
  
  # default: { :roles => [:admin, :user] }
  config.permission_groups_available = { :roles => [:guest, :user], :user_types => [:admin] }

  # default: all Models extracted from ActiveRecord's tables list
  config.models_available = config.models_default - [Admin, CustomSession]

  # default: [:create, :read, :update, :delete, :manage]
  config.actions_available = config.actions_default | [:write, :assign_roles]
end

```

### And mount CantangoEditor somewhere in your app: 

```ruby
# Your_app's root/config/routes.rb

mount CantangoEditor::Engine => "/cantango_editor"
```

## Todo:

- Interface for categories too
- As always ;) more and better tests

## Credits:

- [Stanislaw Pankevich](https://github.com/stanislaw)
- [Marina Balioura](https://github.com/mettta)
