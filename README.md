# Challenge

1. Run `$ bundle`
2. Start up the server: `$ bin/rails s`
3. Visit the root page and follow the instructions

### Static Code Analysis & Formatting

Rubocop is used to check for coding and formatting offenses. Rubocop configuration is included in `.rubocop.yml`.

A number of cops are overridden otherwise we would have to fix the entire default rails project. To perform the check, execute the following:
```
bundle exec rubocop --rails
```

There are currently no offenses detected (with the exception of the overrides).
