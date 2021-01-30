---
title       : Web SDK
description : Reference documentation for Jahuty's Web SDK.
keywords    : [web, javascript, reference]
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
      <a class="stretched-link" href="https://circleci.com/gh/jahuty/jahuty-node"><img src="https://circleci.com/gh/jahuty/jahuty-node.svg?style=svg" alt="Status badge" /></a> <a href="https://codecov.io/gh/jahuty/jahuty-web"><img src="https://codecov.io/gh/jahuty/jahuty-web/branch/master/graph/badge.svg?token=XELPI4FWMI" alt="Coverage badge"/></a>
    </div>
  </div>
</div>

## Installation

This library requires a modern web browser.

Add the following `script` tags to your document:

{% capture installing %}
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/@jahuty/web@0.1.0/dist/web.js"></script>
{% endcapture %}
{% include code.html language="html" code=installing header=false toggle=false select=false %}

## Usage

Once loaded and executed, this script will query the DOM for snippet containers to be filled with content.

Add a container for your snippets to the DOM using the HTML5 [data-* attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/data-*) `data-snippet-id`:

{% capture adding_a_container %}
<div data-snippet-id="YOUR_SNIPPET_ID"></div>
{% endcapture %}
{% include code.html language="html" code=adding_a_container header=false toggle=false select=false %}

Execute the script with your [API key]({% link api.html %}#authentication), after the resource and the DOM have finished loading, to render your snippets:

{% capture rendering %}
<script>
  window.addEventListener('load', function () {
    jahuty('YOUR_API_KEY');
  });
</script>
{% endcapture %}
{% include code.html language="html" code=rendering header=false select=false toggle=false %}

This will cause the `innerHTML` of any element with the `data-snippet-id` attribute to be replaced with its content:

{% capture rendered %}
<div data-snippet-id="YOUR_SNIPPET_ID">
  YOUR_SNIPPET_SOURCE_CODE
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
