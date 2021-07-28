---
title       : PHP SDK
description : Reference documentation for Jahuty's PHP SDK.
keywords    : [php, reference]
permalink   : /sdks/:basename
category    : sdks
---

{% include heading.html title="PHP SDK" lead="Reference documentation for Jahuty's PHP SDK." %}

<div class="card-group my-4">
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Code</small>
    </div>
    <div class="card-body py-2 px-3">
      <a class="stretched-link" href="{{ site.data.urls.sdks.php }}">jahuty/jahuty-php</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Example</small>
    </div>
    <div class="card-body py-2 px-3">
      <a class="stretched-link" href="{{ site.data.urls.examples.php }}">jahuty/jahuty-php-example</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Tests</small>
    </div>
    <div class="card-body p-2 px-3">
      <a href="https://circleci.com/gh/jahuty/jahuty-php"><img src="https://circleci.com/gh/jahuty/jahuty-php.svg?style=svg" alt="Status badge" /></a> <a href="https://codecov.io/gh/jahuty/jahuty-php"><img src="https://codecov.io/gh/jahuty/jahuty-php/branch/master/graph/badge.svg?token=XELPI4FWMI" alt="Coverage badge"/></a>
    </div>
  </div>
</div>

## Installation

This library requires [PHP 7.4+](https://secure.php.net).

It should be installed via [Composer](https://getcomposer.org). To do so, add the following line to the `require` section of your `composer.json` file, and run `composer install`:

{% capture installation %}
{
   "require": {
       "jahuty/jahuty-php": "^5.4"
   }
}
{% endcapture %}
{% include code.html language="javascript" code=installation header=false toggle=false select=false %}

## Usage

Instantiate the client with your [API key]({% link api.html %}#authentication) and use the `snippets->render()` method to render your snippet:

{% capture rendering %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$render = $jahuty->snippets->render(YOUR_SNIPPET_ID);
{% endcapture %}
{% include code.html language="php" code=rendering header=false toggle=false select=false %}

Then, output the render's content by casting it to a `string` or using its `getContent()` method:

{% capture outputting %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$render = $jahuty->snippets->render(YOUR_SNIPPET_ID);

(string)$render;

$render->getContent();
{% endcapture %}
{% include code.html language="php" code=outputting header=false toggle=false select=false %}

In an HTML view:

{% capture rendering_in_view %}
<?php
  $jahuty = new Jahuty\Client('YOUR_API_KEY');
?>
<!doctype html>
<html>
<head>
    <title>Awesome example</title>
</head>
<body>
    <?php echo $jahuty->snippets->render(YOUR_SNIPPET_ID); ?>
</body>
{% endcapture %}
{% include code.html language="php" code=rendering_in_view header=false toggle=false select=false %}

You can also use [tags]({% link components/tags.md %}) and the `snippets->allRenders()` method to render a collection of snippets:

{% capture rendering_a_collection %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$renders = $jahuty->snippets->allRenders('YOUR_TAG');

foreach ($renders as $render) {
  echo $render;
}
{% endcapture %}

{% include code.html language="php" code=rendering_a_collection header=false toggle=false select=false %}

## Rendering the latest content

By default, Jahuty will render a snippet's _published_ content, the content that existed the last time someone clicked the "Publish" button, to avoid exposing your creative process to customers.

You can render a snippet's _latest_ content, the content that currently exists in the editor, to your team in _development_ with the `prefer_latest` configuration option at the library or render level:

{% capture configuring_client_with_latest %}
$jahuty = new Jahuty\Client('YOUR_API_KEY', ['prefer_latest' => true]);
{% endcapture %}
{% include code.html language="php" code=configuring_client_with_latest %}

You can also prefer the latest content (or not) for a collection or render:

{% capture rendering_with_latest %}
// Render the _published_ content for all snippets...
$jahuty = new Jahuty\Client('YOUR_API_KEY');

// ... except, render the _latest_ content for this one...
$render = $jahuty->snippets->render(YOUR_SNIPPET_ID, ['prefer_latest' => true]);

// ... and, this collection.
$renders = $jahuty->snippets->allRenders('YOUR_TAG', ['prefer_latest' => true]);
{% endcapture %}
{% include code.html language="php" code=rendering_with_latest %}

## Passing dynamic parameters

You can use the _same_ snippet to generate _different_ content by defining [variables]({% link liquid/variables.md %}) in your snippets and setting their values via [parameters]({% link liquid/parameters.md %}).

### Snippet parameters

You can pass parameters into your snippet using the options hash and the `params` key:

{% capture rendering_with_params %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$render = $jahuty->snippets->render(YOUR_SNIPPET_ID, [
  'params' => [
    'foo' => 'bar'
  ]
]);
{% endcapture %}
{% include code.html language="php" code=rendering_with_params %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture render_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=render_with_vars %}


### Collection parameters

Collection parameters use a slightly different `params` syntax.

The first dimension of the params array for a collection determines the parameters' scope. You can use the asterisk key (<kbd>*</kbd>) to pass the same parameters to all snippets, or you can use the snippet id as key to pass parameters to a specific snippet.

Both lists will be merged recursively. In the example below, the variable `foo` will be defined as the string `'bar'` for all snippets in the collection, and snippet _1_ will have the additional variable `baz` defined as the string `'qux'`.

{% capture rendering_collection_with_params %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$renders = $jahuty->snippets->allRenders('YOUR_TAG', [
  'params' => [
    '*' => [
      'foo' => 'bar'
    ],
    1 => [
      'baz' => 'qux'
    ]
  ]
]);
{% endcapture %}
{% include code.html language="php" code=rendering_collection_with_params %}

When the same attribute is defined in both sets of parameters, the snippet's parameters will take precedence. In the example below, the variable `foo` will be assigned the value `"bar"` for all snippets, except for snippet _1_, where it will be assigned the value `"qux"`:

{% capture rendering_collection_with_params_and_precedence %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$renders = $jahuty->snippets->allRenders('YOUR_TAG', [
  'params' => [
    '*' => [
      'foo' => 'bar'
    ],
    1 => [
      'foo' => 'qux'
    ]
  ]
]);
{% endcapture %}
{% include code.html language="php" code=rendering_collection_with_params_and_precedence %}

## Reporting render locations

You can use the `render()` method's `location` configuration option to report the absolute URL where a snippet is being rendered. This will help your team preview their changes, and it'll help you find and replace deprecated snippets.

{% capture reporting_locations %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

$render = $jahuty->snippets->render(YOUR_SNIPPET_ID, [
  'location' => 'https://example.com/path/to/render'
]);
{% endcapture %}
{% include code.html language="php" code=reporting_locations %}

Note, locations are only reported when a request is sent to Jahuty's API. As a result, locations will not be reported in some scenarios. For example, if the call to `render()` results in a cache hit, a request will not sent to Jahuty's API, and the location will not be reported.

This configuration option is not supported by the `allRenders()` method.

## Caching for performance

Caching controls how frequently this library requests content from Jahuty's API.

* In _development_, where content is frequently changing and low traffic, you can use the default in-memory store to view content changes instantaneously.
* In _production_, where content is more stable and high traffic, you can configure persistent caching to reduce network requests and improve your application's response time.

### Caching in memory (default)

By default, Jahuty uses an in-memory cache to avoid requesting the same render more than once during the same request. For example:

{% capture caching_default %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

// This call sends a synchronous API request; caches the result in memory; and, returns the result to the caller.
$render1 = $jahuty->snippets->render(YOUR_SNIPPET_ID);

// This call skips sending an API request and uses the cached value instead.
$render2 = $jahuty->snippets->render(YOUR_SNIPPET_ID);
{% endcapture %}
{% include code.html language="php" code=caching_default %}

The in-memory cache only persists for the duration of the original request, however. At the end of the request's lifecycle, the cache will be discarded. To store renders across requests, you need a <em>persistent cache</em>.

### Caching persistently

A persistent cache allows renders to be cached across multiple requests. This reduces the number of synchronous network requests to Jahuty's API and improves your application's average response time.

To configure Jahuty to use a persistent cache, pass a [PSR-16 `CacheInterface`](https://www.php-fig.org/psr/psr-16/) implementation to the client via the `cache` configuration option:

{% capture caching_persistent %}
$jahuty = new Jahuty\Client('YOUR_API_KEY', ['cache' => $cache]);
{% endcapture %}
{% include code.html language="php" code=caching_persistent %}

The persistent cache implementation you choose and configure is up to you. There are many libraries available, and most frameworks provide their own. Any PSR-16 compatible implementation will work.

### Expiring cached renders

There are three methods for configuring a render's Time to Live (TTL), the amount of time between when a render is stored and when it's considered stale. From lowest-to-highest precedence, they are:

1. configuring your caching implementation,
1. configuring this library's default TTL, and
1. configuring a render's TTL.

#### Configuring your caching implementation

You can usually configure your caching implementation with a default TTL. If no other TTL is configured, this library will defer to the caching implementation's default TTL.

#### Configuring this library's default TTL

You can configure a default TTL for all of this library's renders by passing an integer number of seconds or a `DateInterval` instance via the client's `ttl` configuration option:

{% capture ttl_for_library %}
$jahuty = new Jahuty\Client('YOUR_API_KEY', [
  'cache' => $cache,
  'ttl'   => 60  // <- caches all renders for sixty seconds
]);
{% endcapture %}
{% include code.html language="php" code=ttl_for_library %}

If this library's default TTL is set, it will take precedence over the default TTL of the caching implementation.

#### Configuring a render's TTL

You can configure one render's TTL by passing an integer number of seconds or a `DateInterval` instance via its `ttl` configuration option:

{% capture ttl_for_render %}
// default to the caching implementation's TTL for all renders
$jahuty = new Jahuty\Client('YOUR_API_KEY', ['cache' => $cache]);

$render = $jahuty->snippets->render(1, [
  'ttl' => 60  // <- except this render
]);
{% endcapture %}
{% include code.html language="php" code=ttl_for_render %}

### Caching collections

By default, this library will cache each render returned by `allRenders()`:

{% capture caching_collection %}
$jahuty = new Jahuty\Client('YOUR_API_KEY');

// sends a network request, caches each render, and returns the collection
$jahuty->snippets->allRenders('YOUR_TAG');

// ... later in your application

// if this snippet exists in the collection, the cached value will be used
$render = $jahuty->snippets->render(YOUR_SNIPPET_ID);
{% endcapture %}
{% include code.html language="php" code=caching_collection %}

This is a powerful feature! Using tags and the `allRenders()` method, you can render and cache the content of an entire application with a single network request. Then, any call to `render()` a snippet in the collection will load its content from the cache instead of Jahuty's API.

When `allRenders()` can be called outside your request cycle periodically (e.g., a background job), you can turn your cache into your content storage mechanism. You can render and cache your dynamic content as frequently as your like without any hit to your application's response time.

### Disabling caching

You can disable caching, even the default in-memory caching, by passing a `ttl` of zero (`0`) or a negative integer (e.g., `-1`) via any of the methods described above. For example:

{% capture ttl_for_disable %}
// disable all caching
$jahuty1 = new Jahuty\Client('YOUR_API_KEY', ['ttl' => 0]);

// disable caching for one render
$jahuty2 = new Jahuty\Client('YOUR_API_KEY');
$jahuty2->snippets->render(1, ['ttl' => 0]);
{% endcapture %}
{% include code.html language="php" code=ttl_for_disable %}

## Handling errors

If Jahuty's API returns any [status code]({% link api.html %}#errors) other than `2xx`, a `Jahuty\Exception\Error` exception will be thrown:

{% capture errors %}
try {
  $jahuty = new Jahuty\Client('YOUR_API_KEY');
  $render = $jahuty->snippets->render(YOUR_SNIPPET_ID);
} catch (Jahuty\Exception\Error $e) {
  $problem = $e->getProblem();

  echo $problem->getStatus();  // returns status code
  echo $problem->getType();    // returns URL to more information
  echo $problem->getDetail();  // returns description of error
}
{% endcapture %}
{% include code.html language="php" code=errors header=false toggle=false select=false %}

## Example

If you'd like to see this library in action, see [jahuty/jahuty-php-example]({{ site.data.urls.examples.php }}).

## Contributing

Contributions or bug reports are welcome via [GitHub]({{ site.data.urls.sdks.php }})!
