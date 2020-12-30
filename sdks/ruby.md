---
title       : Ruby SDK
description : Reference documentation for Jahuty's Ruby SDK.
keywords    : [ruby, reference]
permalink   : /sdks/:basename
category    : sdks
---
{% include heading.html title="Ruby SDK" lead="Reference documentation for Jahuty's Ruby SDK." %}

<div class="card-group my-4">
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Code</small>
    </div>
    <div class="card-body py-2 px-3">
      <a class="stretched-link" href="{{ site.data.urls.sdks.ruby }}">jahuty/jahuty-ruby</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Example</small>
    </div>
    <div class="card-body py-2 px-3">
      <a class="stretched-link" href="{{ site.data.urls.examples.ruby }}">jahuty/jahuty-ruby-example</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Tests</small>
    </div>
    <div class="card-body p-2 px-3">
      <a href="https://circleci.com/gh/jahuty/jahuty-ruby"><img src="https://circleci.com/gh/jahuty/jahuty-ruby.svg?style=svg" alt="Status badge" /></a> <a href="https://codecov.io/gh/jahuty/jahuty-ruby)"><img src="https://codecov.io/gh/jahuty/jahuty-ruby/branch/master/graph/badge.svg?token=NLDCGGYB8S" alt="Codecov badge" /></a>
    </div>
  </div>
</div>

## Installation

This library requires [Ruby 2.6+](https://www.ruby-lang.org/en/downloads/releases/).

Add this line to your application's `Gemfile` and then run `bundle install`:

{% capture installing %}
gem 'jahuty', '~> 3.0'
{% endcapture %}
{% include code.html language="ruby" code=installing header=false select=false toggle=false %}

## Usage

Instantiate a client with your [API key]({% link api.html %}#authentication) and call `snippets.render`:

{% capture rendering1 %}
jahuty = Jahuty::Client.new(api_key: 'YOUR_API_KEY')

puts jahuty.snippets.render(YOUR_SNIPPET_ID)
{% endcapture %}
{% include code.html language="ruby" code=rendering1 header=false select=false toggle=false %}

You can also access the render's content with `to_s` or `content`:

{% capture rendering2 %}
jahuty = Jahuty::Client.new(api_key: 'YOUR_API_KEY')

render = jahuty.snippets.render(YOUR_SNIPPET_ID)

a = render.to_s

b = render.content

a == b  # returns true
{% endcapture %}
{% include code.html language="ruby" code=rendering2 header=false select=false toggle=false %}

In an HTML view:

{% capture rendering_view %}
<%
  jahuty = Jahuty::Client.new(api_key: 'YOUR_API_KEY')
%>
<!doctype html>
<html>
<head>
    <title>Awesome example</title>
</head>
<body>
    <%= jahuty.snippets.render YOUR_SNIPPET_ID %>
</body>
{% endcapture %}
{% include code.html language="erb" code=rendering_view header=false select=false toggle=false %}

## Parameters

You can [pass parameters]({% link liquid/parameters.md %}) into your snippet using the `params` option:

{% capture rendering_with_params %}
jahuty = Jahuty::Client.new(api_key: 'YOUR_API_KEY')

jahuty.snippets.render(YOUR_SNIPPET_ID, params: { foo: "bar" })
{% endcapture %}
{% include code.html language="ruby" code=rendering_with_params header=false select=false toggle=false %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture rendering_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=rendering_with_vars header=false select=false toggle=false %}

## Errors

If an error occurs with [Jahuty's API]({% link api.html %})#errors, a `Jahuty::Exception::Error` exception will be raised:

{% capture rendering_with_errors %}
begin
  jahuty = Jahuty::Client.new(api_key: 'YOUR_API_KEY')
  jahuty.snippets.render YOUR_SNIPPET_ID
rescue Jahuty::Exception::Error => e
  # The API returned an error. See e.problem for details.
  puts e.problem.type    # a URL to more information
  puts e.problem.status  # the status code
  puts e.problem.detail  # a description of the error
end
{% endcapture %}
{% include code.html language="ruby" code=rendering_with_errors header=false select=false toggle=false %}

## Example

If you'd like to see the SDK in action, see [jahuty/jahuty-ruby-example]({{ site.data.urls.examples.ruby }}).

## Contributing

Bug reports and pull requests are welcome on [GitHub]({{ site.data.urls.sdks.ruby }}).
