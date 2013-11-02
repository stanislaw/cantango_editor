# CantangoEditor

## Warning to folks who are newcomers to Ruby/Rails (November 2, 2013)

People, don't use `cantango_editor`, don't even consider using it!

Also don't use `cantango` and don't even consider using it!

As a second cantango developer I claim that:

1. Cantango is very unstable and it is by no means can be considered production-ready.

2. Even if it was stable, it would still be unrecommended to use it because during four months of heavy development in the summer of 2011 it eventually became a very over-engineered project.

3. Cantango is abandoned by both of its authors: Kristian Mandrup and
   Stanislaw Pankevich.

Think twice, if you do really need so complex role system for your Rails
app! If you do, think twice again and consider implementing this
complexity just using classic CanCan approach.

## Project ABANDONED (June 29, 2012)

**I am not going to continue developing this project any further.
If you liked it, and it serves you well for the purposes of configuring roles
for Cantango permissions system - I would be glad to pass entire project
repository to anyone, who is willing to take a lead on it.**

Cantango Editor is a Rails mountable Engine providing web-interface for editing [CanTango](https://github.com/kristianmandrup/cantango) gem's permissions for any Rails 3 app.

## What it does

It is no more than a nice-looking wrapper interface which is used for editing permissions stored in special yaml file: default is a config/permissions.yml. See "Yaml Permissions store" section on [Permissions](https://github.com/kristianmandrup/cantango/wiki/Permissions) for more details. 

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

  # Permission types to be displayed in interface
  # default: [:user_types, :account_types, :roles, :role_groups, :licenses, :users]
  config.permission_types_available = [:roles, :user_types] 

  # If you do not enumerate all permission_types here - 
  # those that are unmentioned here will just appear empty, having no permission_groups.
  # default: { :roles => [:admin, :user] }. 
  config.permission_groups_available = { :roles => [:guest, :user], :user_types => [:admin] }

  # default: all Models extracted from ActiveRecord's tables list
  config.models_available = config.models_default - [Admin, CustomSession]

  # Cancan's actions
  # default: [:create, :read, :update, :delete, :manage]
  config.actions_available = config.actions_default | [:write, :assign_roles]
end

```

### And mount CantangoEditor somewhere in your app: 

```ruby
# Your_app's root/config/routes.rb

mount CantangoEditor::Engine => "/cantango_editor"
```

## Important note!

Cantango is heavily based on CanCan authorization system.
If you want to have good understanding of how Cantango's permissions rules work we recommend you to read carefully these sections from CanCan's wiki:

- [Defining
  abilities](https://github.com/ryanb/cancan/wiki/Defining-Abilities)
- [Abilities
  Precedence](https://github.com/ryanb/cancan/wiki/Ability-Precedence)

## Todo:

- Interface for categories too
- As always more and better tests

## Credits:

- [Stanislaw Pankevich](https://github.com/stanislaw)
- [Marina Balioura](https://github.com/mettta)
