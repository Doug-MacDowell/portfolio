[![Build Status](https://travis-ci.org/Doug-MacDowell/portfolio.png)](https://travis-ci.org/Doug-MacDowell/portfolio)

# Portfolio

This is a basic portfolio site built using Rails 4.0.2 and Zurb Foundation 5.

Current features include a Posts page, and a Projects listing page.
Authentication using Pundit has been recently added, and comments can now be submitted on posts.

Twitter users now have the ability to sign in and contribute comments.

NEW: Polymorphic associations are now utilized so that comments can be submitted on projects, as well as for posts.

The projects page now uses single-page CRUD courtesy of Ajax.

### Author:  Doug MacDowell

### Installation

TBD - *This is a work in progress for a Rails programming class.*

## Usage

The main page now has enhanced formatting, including a title bar with nav buttons.

The __Postings__ button will take you to the Posts page.

The __Projects__ button takes you to the listing of fictitious projects. From there, new projects can be added, and existing projects can be edited or deleted.

### Link to screenshot of application running on Heroku:

https://www.dropbox.com/s/1ojpe90seot4kc4/Portfolio%20on%20heroku%202014-02-16%2018%3A28%3A42.png

### Contributing

*If this were a real-world project, follow these instructions to contribute:*

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request
