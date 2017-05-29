To run the entire specs in the given spec directory, cd into the main directory containing both the lib and spec directories and run:
$ rspec

To selectively run a particular spec file, you should run:
$ rspec spec/hello_spec.rb

To selectively run a particular chunk in a spec file, you should run:
$ rspec spec/hello_spec.rb:5