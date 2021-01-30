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

This library requires Node 10+.

Install the package with:

{% capture installing_package %}
npm install jahuty --save
# or
yarn add jahuty
{% endcapture %}
{% include code.html language="bash" code=installing_package header=false select=false toggle=false %}

## Usage

Instantiate the `Client` with your [API key]({% link api.html %}#authentication) and use the `snippets.render` method:

{% capture rendering %}
import Client from '@jahuty/jahuty';

const jahuty = new Client({ apiKey: 'YOUR_API_KEY' });

const render = await jahuty.snippets.render(YOUR_SNIPPET_ID);

console.log(render.content);
{% endcapture %}
{% include code.html language="javascript" code=rendering header=false select=false toggle=false %}

You can [pass parameters]({% link liquid/parameters.md %}) into your snippet using the options hash and the `params` key:

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

## Errors

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
