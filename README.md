# Ruby Basics ♦️

This is my approach into _Ruby_ - here I will provide links, configs, codepieces and other miscellaneous related to geting into _Ruby_ programming.

---

<br>

## Ruby installation

[On mac Ruby is default installed but want to have it controlled with Homebrew rbenv](https://danielmarklund.com/brew-rbenv-bundle-explained)

Installation commands for `rbenv`:

```bash
brew install ruby-build

brew install rbenv

# Ensure that ruby is pointing to brew configured ruby
# else configure ~/.zshrc file and add: export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
which ruby
/opt/homebrew/opt/ruby/bin/ruby

rbenv init

# Ensuce correct installation
rbenv -v
```

Installation commands for `ruby`:

```bash
brew upgrade ruby-build

# Recommened version by Odin project
rbenv install 3.4.2 --verbose

# Set global ruby version
rbenv global 3.4.2

# Ensure it's correctly changed
ruby -v
```

Using _Ruby LSP shopify_ extension for VSC.

---

## Ruby Gem

`A "gem" in Ruby is a self-contained package of a library or Ruby program. We can use Ruby's gem command to install the latest version of Rails and its dependencies from RubyGems.org.`

#### Gem installation issues

After installing various packages with _gem_, I encountered issues accessing them. I discovered that I needed to add the path to the directory where the _gems_ were installed in my `~/.zshrc` file:

```bash
# Run this to figure out where a given gem installation is stored
gem list -d <gemname>

# Add this path to ~/.zshrc
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

# After changes made to ~/.zshrc run to update paths etc
source ~/.zshrc
```

---

### Project configuring

Add a `Gemfile` and excute `bundle install`

add following to `Gemfile`:

```ruby
source "https://rubygems.org"

gem "ruby-lsp"
gem "rubocop"
```

---

<br>

## Simple Ruby excecution 🏃‍♀️

Activate the _(REPL)_ / _Interactive Ruby (IRB)_ in terminal type: `irb` or run a ruby file by `ruby <ruby-file>.rb`

[Ruby: How to load a file into interactive ruby console (IRB)?](https://stackoverflow.com/questions/13112245/ruby-how-to-load-a-file-into-interactive-ruby-console-irb)

---

<br>

## Setting up Rails

Following is how _Rails_ was configured and installed.

```bash
gem install rails

# Ensure its installed by checking version
rails --version
```

_Excellent, now \_Rails_ is installed - create a new _Rails app_:\_

```bash
rails new store
```

<br>

_Ensure app is created correctly with the multiple preconfigured folders - if so start app:_

```bash
bin/rails server
```

Generate a controller:

```bash
rails generate controller Home index
```

[Intro to Rails and folder structure explained](https://guides.rubyonrails.org/getting_started.html)

If issues with extension Run `bundle install` standing in the created _Rails app_ to install all the required gems specified in the Gemfile.

---

<br>

### Rails Migtation/ActiveRecord

Commands to create a migration with simple table and related ActiveRecord model and activate / rollback the migraiton.

```bash
# Create a simple products table with related Product model
bin/rails generate model Product name:string

# Running the migration
bin/rails db:migrate

# Rollback latest migration
bin/rails db:rollback
```

---

### Rails console

The Ruby on Rails console is used to interact with ActiveRecords.

```bash
# Activate Rails console
bin/rails console

# Get column names for created Product
Product.column_names
=> ["id", "name", "created_at", "updated_at"]

# Create a new Product - id is nil since it's not persisted in DB
product = Product.new(name: "T-Shirt")
=> #<Product:0x000000012fd524f8 id: nil, name: "T-Shirt", created_at: nil, updated_at: nil>

# Write to DB
product.save
  TRANSACTION (0.4ms)  BEGIN immediate TRANSACTION /*application='Store'*/
  Product Create (9.9ms)  INSERT INTO "products" ("name", "created_at", "updated_at") VALUES ('T-Shirt', '2025-05-24 16:52:45.450023', '2025-05-24 16:52:45.450023') RETURNING "id" /*application='Store'*/
  TRANSACTION (0.7ms)  COMMIT TRANSACTION /*application='Store'*/
=> true

# Instead of using .new -> .create can be used to instantiate and persist Product in a single call
product = Product.create(name: "Crewneck")
  TRANSACTION (0.2ms)  BEGIN immediate TRANSACTION /*application='Store'*/
  Product Create (2.7ms)  INSERT INTO "products" ("name", "created_at", "updated_at") VALUES ('Crewneck', '2025-05-24 16:54:44.025091', '2025-05-24 16:54:44.025091') RETURNING "id" /*application='Store'*/
  TRANSACTION (0.7ms)  COMMIT TRANSACTION /*application='Store'*/
=> #<Product:0x000000013eb27318 id: 2, name: "Crewneck", created_at: "2025-05-24 16:54:44.025091000 +0000", updated_at: "2025-05-24 16:54:44.025091000 +0000">

# Query records using Rails console
Product.all
Product.all
  Product Load (3.2ms)  SELECT "products".* FROM "products" /* loading for pp */ LIMIT 11 /*application='Store'*/
=>
[#<Product:0x000000013eb20798 id: 1, name: "T-Shirt", created_at: "2025-05-24 16:52:45.450023000 +0000", updated_at: "2025-05-24 16:52:45.450023000 +0000">,
 #<Product:0x000000013eb20658 id: 2, name: "Crewneck", created_at: "2025-05-24 16:54:44.025091000 +0000", updated_at: "2025-05-24 16:54:44.025091000 +0000">]
```

---

<br>

## Ruby Courses 📖

[The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby)

[Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)

---

<br>

## Misc Links

[Summary of Ruby on Rails fundamental concepts](https://stackoverflow.com/questions/5205002/summary-of-ruby-on-rails-fundamental-concepts)

[Setting up VSC for Ruby programming](https://medium.com/@terrenceong/ruby-development-with-vs-code-fab258db5f1d)
