# README

* This is a Rail 5.2.3, Ruby 2.6.3 application, with ActiveRecord and PostgreSQL.

* It implements a CSV upload UI on its root page (which is not pretty, because I'm really a back end developer) which uploads a CSV and imports it into the database (in User#import).

* There are three models--User (which probably really should be called Person, as I now realize these people are not necessarily "users"), Skill, and a join model for the many-to-many association between them.

* I have implemented a single API endpoint so far (with the help of the gracious ActiveModel::Serializers), which returns all the users and their associated skills: curl http://localhost:3000/api/users

* Obviously many other GET endpoints could be implemented--getting a specific user by their E-mail address, or getting all users with a particular skill.

* The CSV upload/import code is tested in a feature spec; the controller to upload the CSV and the API controller that implements the endpoint are tested with request specs; and of course the models are tested with model specs (with shoulda-matchers).

* The CSV importing part of this app is definitely not production-ready--it doesn't do any validation or error-checking on its input at all!  That would be something I would add if I had more time.
