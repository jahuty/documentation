---
title       : Creating templates
description : Creating templates in Jahuty.
keywords    : [creating, templates, liquid]
permalink   : /liquid/:basename
category    : liquid
---

{% include heading.html title="Creating templates" lead="Produce different output from the same snippet." %}

A template allows you to produce _different output_ from the _same snippet_. If you aren't familiar with the concept, imagine you'd like to create a snippet to greet your users. Without templates, you'd need to create a separate snippet for each user.

{% include code.html header="Jack's snippet" language=html code="Hello Jack" select=false %}

{% include code.html header="Nancy's snippet" language=html code="Hello Nancy" select=false %}

With templates, you can create a single snippet for all your users by treating their name as a variable.

{% capture code %}{% raw %}Hello {{ name }}{% endraw %}{% endcapture %}
{% include code.html header="Everyone's snippet" language=liquid code=code select=false %}

Then, the variable's value can be [passed as a parameter](parameters) when the snippet is rendered. This allows you to produce _different output_ from the _same snippet_.

Of course, you can do more than just replace names. Jahuty supports the [Liquid](https://shopify.github.io/liquid/) templating language, which supports many powerful features like [variables](variables), [filters](filters),  [controls](controls), and [loops](loops).
