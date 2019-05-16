# Task 2 Solution

## Requirements

- [x] Your solution must use Rails I18n for the label text
- [x] Use Git and commit as often as you think is necessary to properly tell your story
- [x] Write tests using RSpec proving that your solution works (TDD strongly encouraged)
- [x] Use whatever tools you'd like (gems, patterns, etc)
- [x] Engineer your solution as if there's a high chance it will be re-used in other widgets
- [x] Feel free to create new directories, classes, modules, etc...
- [x] Keep lines wrapped at 120 characters
- [x] Enjoy this odd challenge!

## Guidelines

- [x] Coding style (tidyness & legibility)
- [x] Abstractions
- [x] Testing practices
- [x] Security awareness
- [x] Commit journey

## How to use

1. Run `$ bundle`
2. Start up the server: `$ bin/rails s`
3. Visit the root page and follow the instructions

## Testing

There are 11 examples in total, 8 controller tests and 3 view tests.

In Terminal, from the project directory, execute the following:
```
bundle exec rspec
```

Rspec output configuration is included in `.rspec`. To include test profile summary (top 10 slowest examples etc.) change the configuration to include `--profile`:

```
--require spec_helper --colour --format documentation --profile
```

### Code Coverage

SimpleCov is used to report code coverage and is automatically included when you run the Rspec examples. You can access the HTML report after running the Rspec examples (see above) by opening `/coverage/index.html`.

The test suite currently has 100% coverage.

### Static Code Analysis & Formatting

Rubocop is used to check for coding and formatting offenses. Rubocop configuration is included in `.rubocop.yml`.

A number of cops are overridden otherwise we would have to fix the entire default rails project. To perform the check, execute the following:
```
bundle exec rubocop --rails
```

There are currently no offenses detected (with the exception of the overrides).
