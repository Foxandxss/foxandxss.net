# Foxandxss.net Homepages CMS

In the beginning, this project was intended for my *homepage*. But now, is a **CMS** for *homepages*.

With this **CMS** you can create your own *homepage* without hassle.

You will be able to:

* Link all your blogs urls
* Create all kind of pages (projects, books, ...)
    * With optional images
    * With optional extra information
    * With optional links
* A news section (blog like but without comments)
* A sidebar for custom widgets
* A complete admin to manage all our stuff
* Initial i18n support

You can see an example (AKA my [homepage][1])

## Configuration

First of all, you have to set your *Rails* server, in my case I have `thin`:

```ruby
group :production do
    gem 'thin'
end
```

Then, you need to configure settings.

First, you need to edit `config/settings.yml` (would be better if you create a `config/settings.local.yml`):

```yaml
site_title: MySite
```

That's is the title that `ActiveAdmin` will show in the header.

Then, you have `config/settings/production.yml` (again, is better to create a `config/settings/production.local.yml`):

```yaml
email:
  address: smtp.example.com
  port: 111
  domain: example.com
  user_name: mail@example.com
  password: secret
  authentication: plain
  enable_starttls_auto: false

host: example.com
mailer_sender: mail@example.com
```

Here you have the email configuration, the host (so when you create an email, the host is appended to the url) and the mail you will use as a sender.

If you want to try the app in *development* mode, you have to configure `config/settings/development.yml`)

When you migrate your database, a admin user will be created with this credentials:

```
Username: admin@example.com
Password: password
```

If you are not logged in, you have to manually access the admin part: `yourdomain.com/admin`. Then, you will have a link to the admin if you are logged in.

Finally, you need to run `rake db:seed` to create some default options for your app (being able to create a header and footer).

Then, just deploy, compile your assets and have fun.

## TODO

There is a lot of stuff in my TODO's list:

* I18n the ActiveAdmin (waiting their doc).
* Use globalize3 to be able to translate all our pages / news.
* Widget ordering.
* Edit link on every news / pages if you are logged in.
* Some fixes to language flags.

[1]: http://www.foxandxss.net