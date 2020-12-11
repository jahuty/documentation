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
      <a class="stretched-link" href="https://circleci.com/gh/jahuty/jahuty-node"><img src="https://circleci.com/gh/jahuty/jahuty-node.svg?style=svg" alt="Status badge"/></a>
    </div>
  </div>
</div>

## Installation

This library requires Node 14.

Install the package with:

{% capture installing_package %}
npm install jahuty --save
# or
yarn add jahuty
{% endcapture %}
{% include code.html language="bash" code=installing_package header=false select=false toggle=false %}

## Usage

The package needs to be configured with your [API key]({% link api.html %}#authentication) before use, ideally once during startup. Then, you can use the `Snippet.render()` method, which returns a `Promise`, to render a snippet:

{% capture rendering %}
var { Jahuty, Snippet }  = require('@jahuty/jahuty');

Jahuty.setKey('YOUR_API_KEY');

Snippet.render(YOUR_SNIPPET_ID).then(render => console.log(render.content));
{% endcapture %}
{% include code.html language="javascript" code=rendering header=false select=false toggle=false %}

You can [pass parameters]({% link liquid/parameters.md %}) into your snippet using the options hash and the `params` key:

{% capture rendering_with_params %}
Snippet.render(YOUR_SNIPPET_ID, { params: { foo: "bar" }}).then(
  render => console.log(render.content)
);
{% endcapture %}
{% include code.html language="javascript" code=rendering_with_params header=false select=false toggle=false %}

The parameters above would be equivalent to [assigning the variable]({% link liquid/variables.md %}) below in your snippet:

{% capture render_with_vars %}
{% raw %}{% assign foo = "bar" %}{% endraw %}
{% endcapture %}
{% include code.html language="liquid" code=render_with_vars %}

## Errors

If you don't set your API key before calling `Snippet.render()`, an `Error` will be thrown. If [Jahuty's API]({% link api.html %}#errors) returns any status code other than `2xx`, a `NotOk` exception will be thrown:

{% capture rendering_with_errors %}
var { Jahuty, Snippet }  = require('@jahuty/jahuty');

Snippet.render(YOUR_SNIPPET_ID, { params: { foo: "bar" }})
  .then(render => console.log(render.content))
  .catch(error => {
    if (error instanceof NotOk) {
      // The API returned something besides 2xx status code. The error contains
      // a problem property with more information.
      console.error(error.problem);
    } else if (error instanceof Error) {
      // Something else went wrong. Perhaps the key is not set?
      console.error(error.message);
    }
  });
{% endcapture %}
{% include code.html language="javascript" code=rendering_with_errors header=false select=false toggle=false %}

## Example

If you'd like to see the SDK in action, see [jahuty/jahuty-node-example]({{ site.data.urls.examples.node }}).

## Contributing

Bug reports and pull requests are welcome on [GitHub]({{ site.data.urls.sdks.node }}).
