---
title       : Applying a filter
description : How to apply a filter
keywords    : [apply, filter]
permalink   : /liquid/:basename
category    : liquid
---
{% assign examples = site.data.liquid.filters %}

{% include heading.html title="Applying a filter" lead="Global, predefined functions that change the output of a variable." %}

Filters are global, predefined functions that change the output of a variable. Filters are used within an output and separated by the vertical bar character (`|`).

{% include example.html example=examples.introduction %}

Multiple filters can be used on one output. They are applied from left to right.

{% include example.html example=examples.left_to_right %}

## Available filters

The following filters are supported (the links will open in Liquid's documentation):

<table class="table" cellspacing="0" cellpadding="0" border="0">
  <thead>
    <tr>
      <th>Filter</th>
      <th>Function</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/abs/" target="_blank"><code>abs</code></a></td>
      <td>returns the absolute value of a number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/append/" target="_blank"><code>append</code></a></td>
      <td>concatenates two strings and returns the concatenated value</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/at_least/" target="_blank"><code>at_least</code></a></td>
      <td>limits a number to a minimum value</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/at_most/" target="_blank"><code>at_most</code></a></td>
      <td>limits a number to a maximum value</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/capitalize/" target="_blank"><code>capitalize</code></a></td>
      <td>capitalizes the first character of a string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/ceil/" target="_blank"><code>ceil</code></a></td>
      <td>rounds the input up to the nearest whole number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/compact/" target="_blank"><code>compact</code></a></td>
      <td>removes <code>nil</code> values from array</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/concat/" target="_blank"><code>concat</code></a></td>
      <td>concatenates multiple arrays</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/date/" target="_blank"><code>date</code></a></td>
      <td>converts timestamps and well-formatted date strings into other formats</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/default/" target="_blank"><code>default</code></a></td>
      <td>specify a default value if a value is <code>nil</code>, <code>false</code>, or empty</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/divided_by/" target="_blank"><code>divided_by</code></a></td>
      <td>divides a number by another number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/downcase/" target="_blank"><code>downcase</code></a></td>
      <td>make each character in a string lowercase</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/escape/" target="_blank"><code>escape</code></a></td>
      <td>escapes special characters in a string with escape sequences</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/escape_once/" target="_blank"><code>escape_once</code></a></td>
      <td>escapes a string without changing existing entities</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/first/" target="_blank"><code>first</code></a></td>
      <td>returns the first item of an array</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/floor/" target="_blank"><code>floor</code></a></td>
      <td>rounds the input down to the nearest whole number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/join/" target="_blank"><code>join</code></a></td>
      <td>combines the items in an array together into a single string using separator</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/last/" target="_blank"><code>last</code></a></td>
      <td>returns the last item of an array</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/lstrip/" target="_blank"><code>lstrip</code></a></td>
      <td>removes whitespace from the left side of a string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/map/" target="_blank"><code>map</code></a></td>
      <td>creates an array of values by extracting the values of a named property from another object</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/minus/" target="_blank"><code>minus</code></a></td>
      <td>subtracts a number from another number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/join/" target="_blank"><code>join</code></a></td>
      <td>combines the items in an array together into a single string using separator</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/modulo/" target="_blank"><code>modulo</code></a></td>
      <td>returns the remainder of a division operation</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/newline_to_br/" target="_blank"><code>newline_to_br</code></a></td>
      <td>replaces every newline (<code>\n</code>) in a string with an HTML line break (<code>&lt;br /&gt;</code>)</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/plus/" target="_blank"><code>plus</code></a></td>
      <td>adds a number to another number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/prepend/" target="_blank"><code>prepend</code></a></td>
      <td>adds the specified string to the beginning of another string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/remove/" target="_blank"><code>remove</code></a></td>
      <td>removes every occurence of the specified substring from the string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/remove_first/" target="_blank"><code>remove_first</code></a></td>
      <td>removes only the first occurence of the specified substring from the string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/replace/" target="_blank"><code>replace</code></a></td>
      <td>replaces every occurence of a substring in a string with another substring</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/replace_first/" target="_blank"><code>replace_first</code></a></td>
      <td>replaces only the first occurence of a substring in a string with another substring</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/reverse/" target="_blank"><code>reverse</code></a></td>
      <td>reverses the order of the items in an array</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/round/" target="_blank"><code>round</code></a></td>
      <td>rounds a number to the nearest integer (or number of decimal places)</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/rstrip/" target="_blank"><code>rstrip</code></a></td>
      <td>removes all whitespace from the right side of a string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/size/" target="_blank"><code>size</code></a></td>
      <td>returns the number of characters in a string or the number of items in an array</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/slice/" target="_blank"><code>slice</code></a></td>
      <td>returns a substring from the index and for the length specified</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/sort/" target="_blank"><code>sort</code></a></td>
      <td>sorts items in an array in a case-sensitive order</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/sort_natural/" target="_blank"><code>sort_natural</code></a></td>
      <td>sorts items in an array in a case-insensitive order</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/split/" target="_blank"><code>split</code></a></td>
      <td>divides a string into an array using a separator</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/strip/" target="_blank"><code>strip</code></a></td>
      <td>removes whitespace from both sides of a string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/strip_html/" target="_blank"><code>strip_html</code></a></td>
      <td>removes any HTML tags from a string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/strip_newlines/" target="_blank"><code>strip_newlines</code></a></td>
      <td>removes any newline characters from a string</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/times/" target="_blank"><code>times</code></a></td>
      <td>multiplies a number by another number</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/truncate/" target="_blank"><code>truncate</code></a></td>
      <td>shortens a string to the requested number of characters</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/truncatewords/" target="_blank"><code>truncatewords</code></a></td>
      <td>shortens a string to the requested number of words</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/uniq/" target="_blank"><code>uniq</code></a></td>
      <td>removes any duplicate items in an array</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/upcase/" target="_blank"><code>upcase</code></a></td>
      <td>makes each character in a string uppercase</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/url_decode/" target="_blank"><code>url_decode</code></a></td>
      <td>decodes a string that has been encoded as a URL</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/url_encode/" target="_blank"><code>url_encode</code></a></td>
      <td>converts any URL-unsafe characters in a string into percent-encoded characters</td>
    </tr>
    <tr>
      <td><a href="https://shopify.github.io/liquid/filters/where/" target="_blank"><code>where</code></a></td>
      <td>creates an array including only the objects with a given property value</td>
    </tr>
  </tbody>
</table>
