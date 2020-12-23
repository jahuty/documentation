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

Instantiate the client with your [API key]({% link api.html %}#authentication), and use the `snippets->render()` method to output your snippet:

{% capture rendering %}

$jahuty = new \Jahuty\Client('YOUR_API_KEY');

// render your snippet...
$render = $jahuty->snippets->render(YOUR_SNIPPET_ID);

// .. and, cast it to a string...
(string)$render;

// ...or, access its content
$render->getContent();
{% endcapture %}
{% include code.html language="php" code=rendering header=false toggle=false select=false %}

In an HTML view:

{% capture rendering_in_view %}
<?php
  $jahuty = new \Jahuty\Client('YOUR_API_KEY');
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

## Parameters

You can [pass parameters]({% link liquid/parameters.md %}) into your snippet using the options hash and the `params` key:

{% capture rendering_with_params %}
$jahuty = new \Jahuty\Client('YOUR_API_KEY');

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

## Errors

If [Jahuty's API]({% link api.html %}#errors) returns any status code other than `2xx`, a `Jahuty\Exception\Error` exception will be thrown:

{% capture errors %}
try {
  $jahuty = new \Jahuty\Client('YOUR_API_KEY');
  $render = $jahuty->snippets->render(YOUR_SNIPPET_ID);
} catch (\Jahuty\Exception\Error $e) {
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

Contributions or bug reports are welcome via [GitHub]({{ site.data.urls.sdks.php }})!
