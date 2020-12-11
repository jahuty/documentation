---
title       : JavaScript SDK
description : Reference documentation for Jahuty's Web SDK.
keywords    : [javascript, reference]
permalink   : /sdks/:basename
category    : sdks
---

{% include heading.html title="Web SDK" lead="Reference for Jahuty's web SDK." %}

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
      <a class="stretched-link" href="{{ site.data.urls.examples.web }}">jahuty/jahuty-web-example</a>
    </div>
  </div>
  <div class="card">
    <div class="card-header py-2 px-3 text-muted">
      <small>Tests</small>
    </div>
    <div class="card-body p-2 px-3">
      <a class="stretched-link" href="https://circleci.com/gh/jahuty/jahuty-node"><img src="https://circleci.com/gh/jahuty/jahuty-node.svg?style=svg" /></a>
    </div>
  </div>
</div>

## Installation

This library requires a modern web browser.

It's built from the same code as our [Node SDK]({% link sdks/node.md %}), and it's available from the [unpkg.com](https://unpkg.com) CDN. To use this SDK, add the following `script` tag to your document (where `x.y.z` is the latest version):

{% capture installing %}
<script src="https://unpkg.com/@jahuty/jahuty@x.y.z/dist/jahuty.js"></script>
{% endcapture %}
{% include code.html language="html" code=installing header=false toggle=false select=false %}

## Usage

Once configured and initialized, this script will query the DOM for snippet containers to be filled with content.

Add a container for your snippets to the DOM using the HTML5 [data-* attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/data-*) `data-snippet-id`:

{% capture adding_a_container %}
<div data-snippet-id="1">
  <p>
    Hello, world!
  </p>
</div>
{% endcapture %}
{% include code.html language="html" code=adding_a_container header=false toggle=false select=false %}

Set your [API key]({% link api.html %}#authentication) and call `initialize()`, after the resource and the DOM have finished loading, to render your snippets:

{% capture rendering %}
<script>
  window.addEventListener('load', function () {
    jahuty.Jahuty.setKey('kn2Kj5ijmT2pH6ZKqAQyNexUqKeRM4VG6DDgWN1lIcc');
    jahuty.Jahuty.initialize();
  });
</script>
{% endcapture %}
{% include code.html language="html" code=rendering header=false select=false toggle=false %}

This will cause the `innerHTML` of any element with the data-* attribute `data-snippet-id` to be replaced with its content:

{% capture rendered %}
<div data-snippet-id="1">
  <p>
    This is my first snippet!
  </p>
</div>
{% endcapture %}
{% include code.html language="html" code=rendered header=false toggle=false select=false %}

## Parameters

At this time, this package doesn't support parameters.

## Errors

Any errors will be logged to the browser's console.

## Example

If you'd like to see the SDK in action, see [jahuty/jahuty-web-example]({{ site.data.urls.examples.web }}).

## Contributing

Bug reports and pull requests are welcome on [GitHub]({{ site.data.urls.sdks.web }}).
