# RubyBank

A simple Rails banking app.  Users can be created in console.
You can create Users through console and add credit to their account.

  ```
  User.create login: 'satoshi',password: 'nakomoto',:password_confirmation: 'nakomoto'
  User.find_by_login('satoshi').account.add_credit 100
  ```

Users are able to sign in with their login and password.
After login the User can make payments to other Users until they get an Account::BalanceExceededException
because they tried to pay an amount which they don't have.
It is also impossible to try and pay a negative amount in order to credit their account, 
a Transfer::NegativeAmountException is raised.

On the account page there is an audit trail so we can see how we got to the current balance.


## Usage

  * Install gems
    ```
    bundle
    ```
  * Setup database
    ```
    bundle exec rake db:migrate
    bundle exec rake db:seed  # to add test users
    ```
  * Run tests
    ```
    bundle exec r spec
    ```
  * Run server
    ```
    bundle exec rails s
    ```
  * Run console and add users
    ```
    bundle exec rails c
    User.create login: 'mestdaght',password: '12345', password_confirmation: '12345'
    ```


## Versions

  * ruby 2.1.2
  * rails 4.1

