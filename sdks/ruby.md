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

This library is tested with the following [Ruby versions](https://www.ruby-lang.org/en/downloads/releases/):

* MRI 2.6.8
* MRI 2.7.4
* MRI 3.0.2

Add this line to your application's `Gemfile` and then run `bundle install`:

{% capture installing %}
gem 'jahuty', '~> 3.4'
{% endcapture %}
{% include code.html language="ruby" code=installing header=false select=false toggle=false %}

## Usage

Instantiate a client with your [API key]({% link api.html %}#authentication) and call `snippets.render`:

{% capture rendering1 %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

puts jahuty.snippets.render YOUR_SNIPPET_ID
{% endcapture %}
{% include code.html language="ruby" code=rendering1 header=false select=false toggle=false %}

You can also access the render's content with `to_s` or `content`:

{% capture rendering2 %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

render = jahuty.snippets.render YOUR_SNIPPET_ID

render.to_s

render.content
{% endcapture %}
{% include code.html language="ruby" code=rendering2 header=false select=false toggle=false %}

In an HTML view:

{% capture rendering_view %}
<%- jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY' -%>
<!doctype html>
<html>
<head>
    <title>Awesome example</title>
</head>
<body>
    <%== jahuty.snippets.render YOUR_SNIPPET_ID %>
</body>
{% endcapture %}
{% include code.html language="erb" code=rendering_view header=false select=false toggle=false %}

You can also use [tags]({% link components/tags.md %}) and the `snippets.all_renders` method to render a collection of snippets:

{% capture rendering_collection %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

renders = jahuty.snippets.all_renders 'YOUR_TAG'

renders.each { |r| puts r }
{% endcapture %}
{% include code.html language="ruby" code=rendering_collection %}

## Rendering the latest content

By default, Jahuty will render a snippet's _published_ content, the content that existed the last time someone clicked the "Publish" button, to avoid exposing your creative process to customers.

You can render a snippet's _latest_ content, the content that currently exists in the editor, to your team in _development_ with the `prefer_latest` configuration option at the library or render level:

{% capture configuring_library_with_latest %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY', prefer_latest: true
{% endcapture %}
{% include code.html language="ruby" code=configuring_library_with_latest %}

You can also prefer the latest content (or not) for a render or collection:

{% capture rendering_with_latest %}
# Render the _published_ content for all snippets...
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

# ...except, the _latest_ content for this one...
jahuty.snippets.render YOUR_SNIPPET_ID, prefer_latest: true

# ...and these.
jahuty.snippets.all_renders 'YOUR_TAG', prefer_latest: true
{% endcapture %}
{% include code.html language="ruby" code=rendering_with_latest %}

## Using dynamic parameters

You can use the _same_ snippet to generate _different_ content by defining [variables]({% link liquid/variables.md %}) in your snippets and setting their values via [parameters]({% link liquid/parameters.md %}).

### Snippet parameters

You can pass parameters into your snippet using the `params` option:

{% capture rendering_with_params %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

jahuty.snippets.render YOUR_SNIPPET_ID, params: { foo: "bar" }
{% endcapture %}
{% include code.html language="ruby" code=rendering_with_params header=false select=false toggle=false %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture rendering_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=rendering_with_vars header=false select=false toggle=false %}

### Collection parameters

Collection parameters use a slightly different `params` syntax.

If you're rendering a collection, the first dimension of the `params` hash determines the parameters' scope. Use an asterisk key (<kbd>*</kbd>) to pass the same parameters to all snippets, or use a snippet id as key to pass parameters to a specific snippet.

Parameters are merged recursively. For example, the code below will assign the variable `foo` the value `'bar'` for all snippets, including snippet _1_, which will have the additional variable `baz` assigned the value `'qux'`:

{% capture collection_params %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

jahuty.snippets.all_renders 'YOUR_TAG', params: {
  '*' => { foo: 'bar' },
  '1' => { baz: 'qux' }
}
{% endcapture %}
{% include code.html language="ruby" code=collection_params %}

When the same key exists in both parameter lists, the snippet's value will take precedence. For example, the code below will assign the variable `foo` the value `'bar'` for all snippets, except for snippet _1_, where it will be assigned the value `'qux'`:

{% capture collection_params_with_precedence %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

jahuty.snippets.all_renders 'YOUR_TAG', params: {
  '*' => { foo: 'bar' },
  '1' => { foo: 'qux' }
}
{% endcapture %}
{% include code.html language="ruby" code=collection_params_with_precedence %}

## Tracking renders

You can use the `location` configuration option to record the absolute URL where snippets are rendered. This helps your team preview their changes, and it helps you find and replace deprecated snippets.

```ruby
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

render = jahuty.snippets.render YOUR_SNIPPET_ID, location: 'https://example.com'
```

Note, this configuration option is only supported by the `render` method, and locations are only reported when a request is sent to Jahuty's API. As a result of this limitation, locations may not be reported in all scenarios. For example, if a call to `render` results in a cache hit, the location will not be reported.

## Caching for performance

You can use caching to control how frequently this library requests the latest content from Jahuty's API.

* When content is in _development_ (i.e., frequently changing and low traffic), you can use the default in-memory store to view content changes instantaneously with slower response times.
* When content is in _production_ (i.e., more stable and high traffic), you can use persistent caching to update content less frequently and improve your application's average response time.

### Caching in memory (default)

By default, this library uses an in-memory cache to avoid requesting the same render more than once during the same request lifecycle. For example:

{% capture default_caching %}
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'

# This call will send a synchronous API request; cache the result in memory;
# and, return the result to the caller.
render1 = jahuty.snippets.render YOUR_SNIPPET_ID

# This call skips sending an API request and uses the cached value instead.
render2 = jahuty.snippets.render YOUR_SNIPPET_ID
{% endcapture %}
{% include code.html language="ruby" code=default_caching header=false select=false toggle=false %}

The in-memory cache only persists for the duration of the original request, however. At the end of the request's lifecycle, the cache will be discarded. To store renders across requests, you need a persistent cache.

### Caching persistently

A persistent cache allows renders to be cached across multiple requests. This reduces the number of synchronous network requests to Jahuty's API and improves your application's average response time.

To configure Jahuty to use your persistent cache, pass a cache implementation to the client via the `cache` configuration option:

{% capture persistent_caching %}
jahuty = new Jahuty::Client.new(
  api_key: 'YOUR_API_KEY',
  cache: cache
)
{% endcapture %}
{% include code.html language="ruby" code=persistent_caching header=false select=false toggle=false %}

The persistent cache implementation you choose and configure is up to you. There are many libraries available, and most frameworks provide their own. At this time, we support any object which responds to `get(key)` or  `read(key)` and `set(key, value, expires_in:)` or `write(key, value, expires_in:)` including [ActiveSupport::Cache::Store](https://api.rubyonrails.org/classes/ActiveSupport/Cache/Store.html).

### Expiring the cache

There are three methods for configuring this library's `:expires_in`, the amount of time between when a render is stored and when it's considered stale. From lowest-to-highest precedence, the methods are:

1. configuring your caching implementation,
1. configuring this library's default `:expires_in`, and
1. configuring a render's `:expires_in`.

#### Configuring your caching implementation

You can usually configure your caching implementation with a default `:expires_in`. If no other `:expires_in` is configured, this library will defer to the caching implementation's default `:expires_in`.

#### Configuring the library

You can configure a default `:expires_in` for all of this library's renders by passing an integer number of seconds via the client's `:expires_in` configuration option:

{% capture client_expires_in %}
jahuty = Jahuty::Client.new(
  api_key: 'YOUR_API_KEY',
  cache: cache,
  expires_in: 60  # Cache all renders for sixty seconds
)
{% endcapture %}
{% include code.html language="ruby" code=client_expires_in header=false select=false toggle=false %}

If this library's default `:expires_in` is set, it will take precedence over the default `:expires_is` of the caching implementation.

#### Configuring a render

You can configure a single render's `:expires_in` by passing an integer number of seconds via its `:expires_in` configuration option:

{% capture render_expires_in %}
# Default to the caching implementation's :expires_in for all renders.
jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY', cache: cache

# Except, cache this render for 60 seconds.
render = jahuty.snippets.render 1, expires_in: 60
{% endcapture %}
{% include code.html language="ruby" code=render_expires_in header=false select=false toggle=false %}

If a render's `:expires_in` is set, it will take precedence over the library's default `:expires_in` and the caching implementation's `:expires_in`.

### Caching collections

By default, this library will cache each render returned by the `all_renders` method:

{% capture caching_collection %}
jahuty = Jahuty::Client.new(api_key: 'YOUR_API_KEY', cache: cache)

# Sends a network request, caches each render, and returns the collection.
jahuty.snippets.all_renders 'YOUR_TAG';

# If this render exists in the collection, the cached value will be used instead
# of sending a network request for the latest version.
jahuty.snippets.render YOUR_SNIPPET_ID;
{% endcapture %}
{% include code.html language="ruby" code=caching_collection %}

This is a powerful feature, especially when combined with a persistent cache. Using the `all_renders` method, you can render and cache an arbitrarily large chunk of content with a single network request. Because any subsequent call to render a snippet in the collection will use its cached version, you can reduce the number of network requests to load your content and improve your application's response time.

This method is even more powerful when combined with a persistent cache and an asynchronous background job. When `all_renders` can be called outside your request cycle periodically, you can turn your persistent cache into your content storage mechanism. You can render and cache dynamic content as frequently as you like without any hit to your application's response time.

### Disabling caching

You can disable caching, even the default in-memory caching, by passing an `:expires_in` of zero (`0`) or a negative integer (e.g., `-1`) via any of the methods described above. For example:

{% capture disabling_caching %}
# Disable all caching.
jahuty1 = Jahuty::Client.new api_key: 'YOUR_API_KEY', expires_in: 0

# Disable caching for this render.
jahuty2 = Jahuty::Client.new api_key: 'YOUR_API_KEY', expires_in: 60
jahuty2.snippets.render 1, expires_in: 0
{% endcapture %}
{% include code.html language="ruby" code=disabling_caching header=false select=false toggle=false %}

## Handling errors

If an error occurs with [Jahuty's API]({% link api.html %}#errors), a `Jahuty::Exception::Error` exception will be raised:

{% capture rendering_with_errors %}
begin
  jahuty = Jahuty::Client.new api_key: 'YOUR_API_KEY'
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
