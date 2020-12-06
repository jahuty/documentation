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
      <a class="stretched-link" href="https://circleci.com/gh/jahuty/jahuty-php"><img src="https://circleci.com/gh/jahuty/jahuty-php.svg?style=svg" /></a>
    </div>
  </div>
</div>

## Installation

This library requires [PHP 7.3+](https://secure.php.net).

It should be installed via [Composer](https://getcomposer.org). To do so, add the following line to the `require` section of your `composer.json` file (where `x` is the latest major version), and run `composer update`:

{% capture installation %}
{
   "require": {
       "jahuty/jahuty-php": "^x"
   }
}
{% endcapture %}
{% include code.html language="javascript" code=installation header=false toggle=false select=false %}

## Usage

The library needs to be configured with your [API key]({% link api.html %}#authentication) before use, ideally once during startup:

{% capture set_api_key %}
use Jahuty\Jahuty\Jahuty;

Jahuty::setKey('YOUR_API_KEY');
{% endcapture %}
{% include code.html language="php" code=set_api_key header=false toggle=false select=false %}

With the API key set, you can use the `Snippet::render()` method to render a snippet:

{% capture render_snippet %}
use Jahuty\Jahuty\Snippet;

// render the snippet...
$render = Snippet::render(YOUR_SNIPPET_ID);

// .. and, cast it to a string...
(string)$render;

// ...or, access its content
$render->getContent();
{% endcapture %}
{% include code.html language="php" code=render_snippet header=false toggle=false select=false %}

In an HTML view:

{% capture render_snippet_html %}
<?php
use Jahuty\Jahuty\{Jahuty, Snippet};

Jahuty::setKey('YOUR_API_KEY');
?>
<!doctype html>
<html>
<head>
    <title>Awesome example</title>
</head>
<body>
    <?php echo Snippet::render(YOUR_SNIPPET_ID); ?>
</body>
{% endcapture %}
{% include code.html language="php" code=render_snippet_html header=false toggle=false select=false %}

## Parameters

You can [pass parameters]({% link liquid/parameters.md %}) into your snippet using the options hash and the `params` key:

{% capture render_with_params %}
use Jahuty\Jahuty\Snippet;

$render = Snippet::render(YOUR_SNIPPET_ID, ['params' => ['foo' => 'bar']]);
{% endcapture %}
{% include code.html language="php" code=render_with_params %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture render_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=render_with_vars %}

## Errors

If you don't set your API key before calling `Snippet::render()`, a `BadMethodCallException` will be thrown, and if [Jahuty's API]({% link api.html %}#errors) returns any status code other than `2xx`, a `NotOk` exception will be thrown:

{% capture errors %}
use Jahuty\Jahuty\Snippet;
use Jahuty\Jahuty\Exception\NotOk;

try {
  $render = Snippet::render(YOUR_SNIPPET_ID);
} catch (BadMethodCallException $e) {
  // did you call Jahuty::setKey() first?
} catch (NotOk $e) {
  // the API returned something besides 2xx status code
  $problem = $e->getProblem();

  echo $problem->getStatus();  // returns status code
  echo $problem->getType();    // returns URL to more information
  echo $problem->getDetail();  // returns description of error
}
{% endcapture %}
{% include code.html language="php" code=errors header=false toggle=false select=false %}

## Example

If you'd like to see the SDK in action, see [jahuty/jahuty-php-example]({{ site.data.urls.examples.php }}).

## Contributing

Bug reports and pull requests are welcome on [GitHub]({{ site.data.urls.sdks.php }}).
