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
      <a class="stretched-link" href="https://circleci.com/gh/jahuty/jahuty-ruby"><img src="https://circleci.com/gh/jahuty/jahuty-ruby.svg?style=svg" alt="Status badge" /></a>
    </div>
  </div>
</div>

## Installation

This library requires [Ruby 2.3+](https://www.ruby-lang.org/en/downloads/releases/).

Add this line to your application's `Gemfile` and then run `bundle install`:

{% capture installing %}
gem "jahuty", "~> 2.0"
{% endcapture %}
{% include code.html language="ruby" code=installing header=false select=false toggle=false %}

## Usage

The library needs to be configured with your [API key]({% link api.html %}#authentication) before use, ideally once during startup:

{% capture setting_api_key %}
require "jahuty"

Jahuty.key = "YOUR_API_KEY"
{% endcapture %}
{% include code.html language="ruby" code=setting_api_key header=false select=false toggle=false %}

With the API key set, you can use the `Snippet.render` method to render a snippet:

{% capture rendering_snippet %}
require "jahuty"

# retrieve the snippet
render = Snippet.render YOUR_SNIPPET_ID

# convert it to a string
render.to_s

# or, access its attributes
render.content
{% endcapture %}
{% include code.html language="ruby" code=rendering_snippet header=false select=false toggle=false %}

In an HTML view:

{% capture rendering_view %}
<%
require "jahuty"  

Jahuty.key = "YOUR_API_KEY"
%>
<!doctype html>
<html>
<head>
    <title>Awesome example</title>
</head>
<body>
    <%= Snippet.render YOUR_SNIPPET_ID %>
</body>
{% endcapture %}
{% include code.html language="erb" code=rendering_view header=false select=false toggle=false %}

## Parameters

You can [pass parameters]({% link liquid/parameters.md %}) into your snippet using the `params` key of the options hash:

{% capture rendering_with_params %}
require "jahuty"

Snippet.render(YOUR_SNIPPET_ID, params: { foo: "bar" });
{% endcapture %}
{% include code.html language="ruby" code=rendering_with_params header=false select=false toggle=false %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture rendering_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=rendering_with_vars header=false select=false toggle=false %}

## Errors

If you don't set your API key before calling `Snippet.render`, a `StandardError` will be raised. If an error occurs with [Jahuty's API]({% link api.html %}), a `NotOk` exception will be raised:

{% capture rendering_with_errors %}
require "jahuty"

begin
  Snippet.render YOUR_SNIPPET_ID
rescue StandardError => e
  # hmm, did you set the API key first?
rescue Jahuty::Exception::NotOk => e
  # hmm, the API returned something besides 2xx status code
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
