---
title       : Passing a parameter
description : How to pass a parameter.
keywords    : [pass, parameter]
---
{% assign examples = site.data.liquid.parameters %}

# Passing a parameter

Parameters assign values to [variables](variables) when you [render a snippet](/snippets/rendering). This allows you to re-use the same snippet with different values.

{% include example.html example=examples.introduction1 %}

You can use the _same_ snippet and a _different_ parameter for a different output:

{% include example.html example=examples.introduction2 %}

Array parameters are supported.

{% include example.html example=examples.arrays %}

Object parameters are also supported.

{% include example.html example=examples.objects %}

## Precedence

Given the various ways you can set variables, it's important to consider the following precedence:

1. The `assign` tag takes precedence over parameters.
1. Parameters take precedence over the [`default`](filters#default) filter.
1. If a variable has no value via `assign`, parameters, or a `default` filter, it's [`nil`](variables#nil).
1. If extra parameters are passed, they're ignored.

For example:

{% include example.html example=examples.precedence %}

* the value of `foo` was "hat", because `assign` takes precedence over parameters;
* the value of `bar` was passed by parameters;
* the value of `baz` was never assigned or passed by parameter, so nothing was printed to the page;
* the value of `qux` was never assigned or passed by parameter, but the `default` filter printed "shoes" to the page; and,
* the parameter `corge` was passed but never used and ignored.
