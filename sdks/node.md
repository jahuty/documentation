---
title       : Node.js SDK
description : Reference documentation for Jahuty's Node.js SDK.
keywords    : [node, js, reference]
permalink   : /sdks/:basename
category    : sdks
---

{% include heading.html title="Node.js SDK" lead="Reference documentation for Jahuty's Node.js SDK." %}

<div class="card-group my-4">
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Code</small>
    </div>
    <div class="card-body py-2 px-3">
      <a class="stretched-link" href="{{ site.data.urls.sdks.node }}">jahuty/jahuty-node</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Example</small>
    </div>
    <div class="card-body py-2 px-3">
      <a class="stretched-link" href="{{ site.data.urls.examples.node }}">jahuty/jahuty-node-example</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Tests</small>
    </div>
    <div class="card-body p-2 px-3">
      <a href="https://circleci.com/gh/jahuty/jahuty-node"><img src="https://circleci.com/gh/jahuty/jahuty-node.svg?style=svg" alt="Status badge"/></a> <a href="https://codecov.io/gh/jahuty/jahuty-node"><img src="https://codecov.io/gh/jahuty/jahuty-node/branch/master/graph/badge.svg?token=XELPI4FWMI" alt="Coverage badge"/></a>
    </div>
  </div>
</div>

## Installation

This library requires Node 10+. It is written using ES6 syntax and transpiled to CommonJS for maximum compatibility.

Install the package with:

{% capture installing_package %}
npm install jahuty --save
# or
yarn add jahuty
{% endcapture %}
{% include code.html language="bash" code=installing_package header=false select=false toggle=false %}

## Usage

Instantiate the `Client` with your [API key]({% link api.html %}#authentication) and use the `snippets.render()` method:

{% capture rendering %}
import Client from '@jahuty/jahuty';

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

const render = await jahuty.snippets.render(YOUR_SNIPPET_ID);

console.log(render.content);
{% endcapture %}
{% include code.html language="javascript" code=rendering %}

You can also use [tags]({% link components/tags.md %}) to render a collection of snippets with the `snippets.allRenders()` method:

{% capture rendering_collection %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ api_key: 'YOUR_API_KEY' });

const renders = await jahuty.snippets.allRenders('YOUR_TAG');

renders.forEach((render) => console.log(render));
{% endcapture %}
{% include code.html language="javascript" code=rendering_collection %}

## Rendering the latest content

By default, Jahuty will render a snippet's _published_ content, the content that existed the last time someone clicked the "Publish" button, to avoid exposing your creative process to customers.

You can render a snippet's _latest_ content, the content that currently exists in the editor, instead with the `preferLatest` configuration option at the library or render level:

{% capture configuring_with_latest %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY', preferLatest: true });
{% endcapture %}
{% include code.html language="javascript" code=configuring_with_latest %}

You can also prefer the latest content (or not) for a render or collection:

{% capture rendering_with_latest %}
const Client = require('@jahuty/jahuty').default;

// Render the _published_ content for all snippets...
const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

// ...except, render the _latest_ content for this one...
const render = await jahuty.snippets.render(YOUR_SNIPPET_ID, { preferLatest: true });

// ...and these.
const renders = await jahuty.snippets.render('YOUR_TAG', { preferLatest: true });
{% endcapture %}
{% include code.html language="javascript" code=rendering_with_latest %}

## Using dynamic parameters

You can use the _same_ snippet to generate _different_ content by defining [variables]({% link liquid/variables.md %}) in your snippets and setting their values via [parameters]({% link liquid/parameters.md %}).

### Snippet parameters


You can pass parameters into your snippet using the options hash and the `params` key:

{% capture rendering_with_params %}
import Client from '@jahuty/jahuty';

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

const render = jahuty.snippets.render(YOUR_SNIPPET_ID, {
  params: { foo: "bar" }
});

console.log(render.content);
{% endcapture %}
{% include code.html language="javascript" code=rendering_with_params header=false select=false toggle=false %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture render_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=render_with_vars %}

### Collection parameters

Collection parameters use a slightly different `params` syntax.

The first dimension of the `params` key determines the parameters' scope. Use an asterisk key (<kbd>*</kbd>) to pass the same parameters to all snippets, or use a snippet id as key to pass parameters to a specific snippet.

The two parameter lists will be merged recursively. For example, the code below will assign the variable `foo` the value `'bar'` for all snippets, including snippet _1_, which will also have the variable `baz` be assigned the value `'qux'`:

{% capture rendering_collection_with_params %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

const renders = await jahuty.snippets.allRenders('YOUR_TAG', {
  params: {
    '*': { foo: 'bar' },
    '1': { baz: 'qux' },
  },
});
{% endcapture %}
{% include code.html language="javascript" code=rendering_collection_with_params %}

Parameters for a specific snippet will take precedence over parameters for all snippets. For example, the code below will assign the variable `foo` the value `"bar"` for all snippets, except for snippet _1_, where it will be assigned the value `"qux"`:

{% capture rendering_collection_with_precedence %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

const renders = await jahuty.snippets.allRenders('YOUR_TAG', {
  params: {
    '*': { foo: 'bar' },
    '1': { foo: 'qux' },
  },
});
{% endcapture %}
{% include code.html language="javascript" code=rendering_collection_with_precedence %}

## Tracking renders

You can record where snippets are rendered using the `location` configuration option. This helps your team preview their changes, and it helps you find and replace deprecated snippets.

{% capture rendering_with_location %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

const render = await jahuty.snippets.render(YOUR_SNIPPET_ID, {
  location: 'https://example.com'
});
{% endcapture %}
{% include code.html language="javascript" code=rendering_with_location %}

Note, this configuration option is only supported by the `render()` method, and because locations are only reported when a request is sent to Jahuty's API, they may not be reported in all scenarios (e.g., if a call to `render` results in a cache hit).

## Caching for performance

You can use caching to control how frequently this library requests the latest content from Jahuty's API.

* When content is in _development_ (i.e., frequently changing and low traffic), you can use the default in-memory store to view content changes instantaneously with slower response times.
* When content is in _production_ (i.e., more stable and high traffic), you can use persistent caching to update content less frequently and improve your application's response time.

### Caching in memory (default)

By default, this library uses an in-memory cache to avoid requesting the same render more than once during the same request lifecycle. For example:

{% capture caching %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

// sends a synchronous API request; caches the result in memory; and,
// returns it to the caller
const render1 = jahuty.snippets.render(YOUR_SNIPPET_ID);

// this call skips sending an API request and uses the cached value instead.
const render2 = jahuty.snippets.render(YOUR_SNIPPET_ID);
{% endcapture %}
{% include code.html language="javascript" code=caching %}

The in-memory cache only persists for the duration of the original request. At the end of the request's lifecycle, the cache will be discarded. To store renders across requests, you need a persistent cache.

### Caching persistently

A persistent cache allows renders to be cached across multiple requests. This reduces the number of synchronous network requests to Jahuty's API and improves your application's average response time.

To configure Jahuty to use your persistent cache, pass a cache implementation to the client via the `cache` configuration option:

{% capture persistent_caching %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY', cache: CACHE_INSTANCE });
{% endcapture %}
{% include code.html language="javascript" code=persistent_caching %}

The persistent cache implementation you choose and configure is up to you. There are many libraries available, and most frameworks provide their own. At this time, we support any cache implementation which responds to `get(key)`/`set(key, value, ttl)` such as  [Keyv](https://www.npmjs.com/package/keyv).

### Expiring the cache

There are three methods for configuring this library's time-to-live (`ttl`), the amount of time between when a render is stored and when it's considered stale. From lowest-to-highest precedence, the methods are:

1. configuring your caching implementation,
1. configuring this library's default `ttl`, and
1. configuring a render's `ttl`.

#### Configuring your caching implementation

You can usually configure your caching implementation with a default `ttl`. If no other `ttl` is configured, this library will defer to the caching implementation's default `ttl`.

#### Configuring this library's default `ttl`

You can configure a default `ttl` for all of this library's renders by passing an integer number of seconds via the client's `ttl` configuration option:

{% capture configuring_default_ttl %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({
  apiKey: 'YOUR_API_KEY',
  cache: YOUR_CACHE_INSTANCE,
  ttl: 60  // <- cache renders for 60 seconds
});
{% endcapture %}
{% include code.html language="javascript" code=configuring_default_ttl %}

If this library's default `ttl` is set, it will take precedence over the default `ttl` of the caching implementation.

#### Configuring a render's `ttl`

You can configure `ttl` for individual renders by passing an integer number of seconds via the render method's `ttl` configuration option:

{% capture configuring_render_ttl %}
const Client = require('@jahuty/jahuty').default;

// cache all renders five minutes
const jahuty = new Client({
  apiKey: 'YOUR_API_KEY',
  cache: YOUR_CACHE_INSTANCE,
  ttl: 300
});

// except, cache this render for 60 seconds
const render = jahuty.snippets.render(YOUR_SNIPPET_ID, { ttl: 60 });

// except, cache the renders in this collection for 120 seconds
const renders = jahuty.snippets.allRenders('YOUR_TAG', { ttl: 120 });
{% endcapture %}
{% include code.html language="javascript" code=configuring_render_ttl %}

If a render's `ttl` is set, it will take precedence over the library's default `ttl` and the caching implementation's `ttl`.

### Caching collections

By default, this library will cache the individual renders returned by the `allRenders()` method:

{% capture caching_collections %}
const Client = require('@jahuty/jahuty').default;

const jahuty = new Client({ apiKey: 'YOUR_API_KEY', cache: YOUR_CACHE_INSTANCE });

// sends a network request, caches each render, and returns the collection
const renders = jahuty.snippets.allRenders('YOUR_TAG');

// if this render exists in the collection, the cached value will be used
// instead of sending a network request for the latest version
const render = jahuty.snippets.render(YOUR_SNIPPET_ID);
{% endcapture %}
{% include code.html language="javascript" code=caching_collections %}

This is a powerful feature when combined with a persistent cache. Using the `allRenders()` method, you can render and cache an arbitrarily large chunk of content with a single network request. Since any subsequent calls to `render` a snippet in the collection will use its cached version, you can reduce the number of network requests to load your content.

This method is even more powerful when combined with an asynchronous background job. When `allRenders()` can be called outside your request cycle periodically, you can turn your cache into your content storage mechanism. You can render and cache dynamic content as frequently as you like without any hit to your application's response time.

### Disabling caching

You can disable caching, even the default in-memory caching, by passing an `ttl` of zero (`0`) or a negative integer (e.g., `-1`) via any of the methods described above. For example:

{% capture disabling_caching %}
const Client = require('@jahuty/jahuty').default;

// disable all caching
const jahuty1 = new Client({ apiKey: 'YOUR_API_KEY', ttl: 0 });

// disable caching for a specific render
const jahuty2 = new Client({ apiKey: 'YOUR_API_KEY' });
jahuty2.snippets.render(1, { ttl: 0 });
{% endcapture %}
{% include code.html language="javascript" code=disabling_caching %}

## Handling errors

If [Jahuty's API]({% link api.html %}#errors) returns any status code other than `2xx`, a `BadResponse` exception will be thrown:

{% capture rendering_with_errors %}
import Client from '@jahuty/jahuty';

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

try {
  const render = jahuty.snippets.render(YOUR_SNIPPET_ID);
} catch (error) {
  if ('problem' in error) {
    // The API returned something besides 2xx status code. The error contains
    // a problem property with more information.
    console.error(error.problem);
  } else if (error instanceof Error) {
    // Something else went wrong.
    console.error(error);
  }
}
{% endcapture %}
{% include code.html language="javascript" code=rendering_with_errors header=false select=false toggle=false %}

## Example

If you'd like to see the SDK in action, see [jahuty/jahuty-node-example]({{ site.data.urls.examples.node }}).

## Contributing

Bug reports and pull requests are welcome on [GitHub]({{ site.data.urls.sdks.node }}).
