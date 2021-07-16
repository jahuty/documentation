---
title       : Creating templates
description : Creating templates in Jahuty.
keywords    : [creating, templates, liquid]
permalink   : /liquid/:basename
category    : liquid
---

{% include heading.html title="Creating templates" lead="A template allows you to produce different output from the same snippet." %}

If you aren't familiar with the concept of templates, imagine you'd like to create a snippet to greet your users. Without templates, you'd need to create a separate, hard-coded snippet for each user.

{% include code.html header="Jack's snippet" language=html code="Hello Jack!" select=false %}

{% include code.html header="Nancy's snippet" language=html code="Hello Nancy!" select=false %}

With templates, you can create a single snippet for your users by treating their name as a placeholder...

{% capture code %}{% raw %}Hello {{ name }}!{% endraw %}{% endcapture %}
{% include code.html header="Everyone's snippet" language=liquid code=code select=false %}

... and defining the placeholder's value when the snippet is displayed using [parameters](parameters).

{% capture output %}
<!-- snippets/1/render?params={"name":"Jack"} -->
Hello Jack!

<!-- snippets/1/render?params={"name":"Nancy"} -->
Hello Nancy!
{% endcapture %}
{% include code.html header="Using templates" language=liquid code=output select=false %}

Of course, you can do more than just replace names. Jahuty supports the [Liquid](https://shopify.github.io/liquid/) templating language, which supports many powerful features including [variables](variables), [filters](filters),  [controls](controls), and [loops](loops).
