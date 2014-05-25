[![Build Status](https://travis-ci.org/Doug-MacDowell/portfolio.png)](https://travis-ci.org/Doug-MacDowell/portfolio)

# Portfolio

This is a basic portfolio site built using Rails 4.0.2, PostgreSQL 9.1, Zurb Foundation 5.
The site has a Posts page, as well as a Projects page where images can be uploaded to
projects via CarrierWave.

This project is being developed as part of a Ruby & Rails course at the University of Washington.

### Current Features:
Authentication uses Pundit, and comments can be submitted on posts, subject to approval by
the site Editor.

Twitter users now have the ability to sign in with their Twitter account and contribute comments.

Polymorphic associations are utilized so that comments can be submitted on projects, as well as for posts.

The projects page uses single-page CRUD courtesy of Ajax.

Incoming email can be published as Postings.

NEW! A background worker utilizing Sidekiq has been added. This worker will send email to the Editor whenever comments are submitted for approval.

### Author:  Doug MacDowell

### Installation

TBD - *This is a work in progress for a Rails programming class.*

## Usage

Enhanced formatting, including a title bar with nav buttons, is used throughout the site.

The __Postings__ button will take you to the Posts page, which includes Posts that arrive via email.  Comments can be added to any published post.

The __Projects__ button takes you to the listing of fictitious projects. From there, new projects can be added, and existing projects can be edited or deleted. Project images can be uploaded.

### Link to screenshot of application running on Heroku:

https://www.dropbox.com/s/1ojpe90seot4kc4/Portfolio%20on%20heroku%202014-02-16%2018%3A28%3A42.png

### Contributing

*If this were a real-world project, follow these instructions to contribute:*

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request
