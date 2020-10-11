# README

To execute the code, run the following commands below:

* gem install bundler

* bundle install

* rails s

Once the project is running access:

* http://localhost:3000 to download the file with all absences

* http://localhost:3000?userId=123 to download the file with basences of a user by id

* http://localhost:3000?startDate=2017-01-01&endDate=2017-02-01 to download the file with absences in the given date range

To run the tests execute the command:

* bundle exec rspec
