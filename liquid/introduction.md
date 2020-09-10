---
title       : Creating templates
description : Creating templates in Jahuty.
keywords    : [creating, templates, liquid]
category    : liquid
---

# Creating templates

A template allows you to produce _different output_ from the _same snippet_. 

If you aren't familiar with the concept of templates, imagine you'd like to create a snippet to greet your users. Without templates, you'd need to create a separate snippet for each user.

{% include code.html header="Jack's snippet" language=html code="Hello Jack" %}

{% include code.html header="Nancy's snippet" language=html code="Hello Nancy" %}

You get the idea.

With templates, you can create a single snippet for all your users by treating their name as a placeholder.

{% capture code %}{% raw %}Hello {{ name }}{% endraw %}{% endcapture %}
{% include code.html header="Everyone's snippet" language=liquid code=code %}

The value of the placeholder can be [passed as a parameter](parameters) when the snippet is rendered. This allows you to produce _different output_ from the _same snippet_.

Of course, you can do more than just replace names. Jahuty supports the [Liquid](https://shopify.github.io/liquid/) templating language, which supports many powerful features like [variables](variables), [filters](filters),  [controls](controls), and [loops](loops).
