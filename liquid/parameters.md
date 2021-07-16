---
title       : Passing a parameter
description : How to pass a parameter
keywords    : [pass, parameter]
permalink   : /liquid/:basename
category    : liquid
---
{% assign examples = site.data.liquid.parameters %}

{% include heading.html title="Passing a parameter" lead="Parameters assign values to variables at render time." %}

The `assign` and `capture` tags are helpful, but they're static. Their values don't change from render to render.

Parameters, on the other hand, assign values to [variables]({% link liquid/variables.md %}) each time you [render a snippet](/components/snippets#rendering-snippets). This allows you to use the same snippet to produce different output.

{% include example.html example=examples.introduction1 %}

You can use the _same_ snippet and a _different_ parameter for a different output:

{% include example.html example=examples.introduction2 %}

Array parameters are supported.

{% include example.html example=examples.arrays %}

Object parameters are also supported.

{% include example.html example=examples.objects %}

## Precedence

Given the various ways you can set variables, it's important to consider precedence:

1. The `assign` tag takes precedence over parameters.
1. Parameters take precedence over the [`default`](filters) filter.
1. If a variable has no value via `assign`, parameters, or a `default` filter, it's [`nil`](variables#nil).
1. If extra parameters are passed, they're ignored.

For example:

{% include example.html example=examples.precedence %}

* the value of `foo` was `"hat"`, because, although `foo` was passed as a parameter, `assign` takes precedence;
* the value of `bar` was passed by parameters;
* the value of `baz` was neither assigned nor passed by parameter, so it's value was `nil` and nothing was output;
* the value of `qux` was neither assigned nor passed by parameter, but the `default` filter printed `"shoes"` to the page; and,
* the parameter `corge` was passed but never used and ignored.
