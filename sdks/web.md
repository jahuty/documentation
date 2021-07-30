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
      <a class="stretched-link" href="{{ site.data.urls.sdks.web }}">jahuty/jahuty-web</a>
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

## Installation and usage

This library supports the last two versions of modern web browsers like Safari, Chrome, and Firefox.

Add the following deferred `script` tag to your document:

{% capture installing %}
<script defer src="https://unpkg.com/@jahuty/web@0.2.1/dist/jahuty.js"></script>
{% endcapture %}
{% include code.html language="html" code=installing %}

Add a script to execute `jahuty()` after resources and DOM have finished loading:

{% capture script %}
<script>
  window.addEventListener('DOMContentLoaded', function () {
    jahuty({ apiKey: 'YOUR_API_KEY' });
  });
</script>
{% endcapture %}
{% include code.html language="html" code=script %}

Add snippet containers with the `data-snippet-id` HTML5 [data-* attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/data-*):

{% capture adding_a_container %}
<div data-snippet-id="YOUR_SNIPPET_ID"></div>
{% endcapture %}
{% include code.html language="html" code=adding_a_container header=false toggle=false select=false %}

This will cause the `innerHTML` of any element with the `data-snippet-id` attribute to be replaced with its content:

{% capture rendered %}
<div data-snippet-id="YOUR_SNIPPET_ID">
  YOUR_SNIPPET_SOURCE_CODE
</div>
{% endcapture %}
{% include code.html language="html" code=rendered %}

## Rendering content

By default, Jahuty will render a snippet's _published_ content, the content that existed the last time a teammate clicked the "Publish" button, to avoid exposing your creative process to customers.

You can render a snippet's _latest_ content, the content that currently exists in the editor, in the current environment with the `preferLatest` configuration option:

{% capture client_with_latest %}
<script>
  document.addEventListener('DOMContentLoaded', function () {
    jahuty({ apiKey: 'YOUR_API_KEY', preferLatest: true });
  });
</script>
{% endcapture %}
{% include code.html language="html" code=client_with_latest %}

You can also prefer the latest content (or not) for a single render with the `data-snippet-latest` attribute:

{% capture render_with_latest %}
<div data-snippet-id="YOUR_SNIPPET_ID" data-snippet-latest="true"></div>
{% endcapture %}
{% include code.html language="html" code=render_with_latest %}

## Passing parameters

You can [pass parameters]({% link liquid/parameters.md %}) into your render by passing a valid JSON string as the `data-snippet-params` attribute:

{% capture passing_params %}
<div data-snippet-id="YOUR_SNIPPET_ID"
     data-snippet-params='{"foo":"bar"}'></div>
{% endcapture %}
{% include code.html language="html" code=passing_params %}

The parameters above would be equivalent to [assigning the variables]({% link liquid/variables.md %}) below in your snippet:

{% capture assigning_variables %}{% raw %}
{% assign foo = "bar" %}
{% endraw %}{% endcapture %}
{% include code.html language="liquid" code=assigning_variables %}

## Tracking renders

You can record where snippets are rendered - the value of the `window.location.href` variable - using the `data-snippet-location` attribute:

{% capture with_location %}
<div data-snippet-id="YOUR_SNIPPET_ID" data-snippet-location="true"></div>
{% endcapture %}
{% include code.html language="html" code=with_location %}

## Handling errors

Any errors will be logged to the browser's console.

## Example

If you'd like to see the SDK in action, see [jahuty/jahuty-web-example]({{ site.data.urls.examples.web }}).

## Contributing

Bug reports and pull requests are welcome on [GitHub]({{ site.data.urls.sdks.web }}).
