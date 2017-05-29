To follow industry convention, you should create a lib folder to hold all your actual files, and a spec folder to hold all the corresponding spec or test files. And then create a Gemfile within the same directory that holds the lib and spec directories. put "gem 'rspec'" within the gemfile and then run bundle install in your root directory. This should create a Gemfile.lock file. Your file tree should look something like this:
root_folder
  lib/
  spec/
  Gemfile
  Gemfile.lock

To run the entire specs in the given spec directory, cd into the main directory containing both the lib and spec directories and run:
$ rspec

To selectively run a particular spec file, you should run:
$ rspec spec/hello_spec.rb

To selectively run a particular chunk in a spec file, you should run:
$ rspec spec/hello_spec.rb:5