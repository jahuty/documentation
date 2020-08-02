# documentation

Documentation for Jahuty.

## Development

## Testing

To test the site in the browser with RSpec and Capybara, we'll run our static site as a Rack application in the `test` environment (the gist, [Testing Your Jekyll Site, The Ruby Way](https://gist.github.com/deanmarano/aeae5cd2d357fec1b06e30ead397d4e3) was helpful in setting this up).

To run the tests, use `rspec` (use the `bundle exec` prefix if you have gem version issues):

```bash
~/projects/jahuty/marketing $ bundle exec rspec
```

The code above will run the `js: true` tests in a headless chrome browser. To run the tests in a visible browser window, prefix the command with `HEADLESS=false`:

```bash
~/projects/jahuty/marketing $ HEADLESS=false bundle exec rspec
```
