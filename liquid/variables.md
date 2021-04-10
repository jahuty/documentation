---
title       : Assigning a variable
description : How to assign a variable.
keywords    : [assign, variable]
permalink   : /liquid/:basename
category    : liquid
---
{% assign examples = site.data.liquid.variables %}

{% include heading.html title="Assigning a variable" lead="Variables are placeholders for values that change." %}

Variables output values in your snippets. Variable names are denoted by double curly braces: {% raw %}`{{`{% endraw %} and {% raw %}`}}`{% endraw %}. To render the content of a variable called `title` with the value `hello world`:

{% include example.html example=examples.introduction %}

## Initializing variables

You can initialize variables with the `assign` or `capture` tags. You can also initialize variables with [parameters]({% link liquid/parameters.md %}).

### `assign`

Creates a new variable.

{% include code.html language="liquid" code=examples.assign %}

### `capture`

Captures the string inside of the opening and closing tags and assigns it to a variable. Variables created through `capture` are strings.

{% include code.html language="liquid" code=examples.capture %}

## Types

There are five variable types: string, number, boolean, `nil`, and array.

### String

Declare a string by wrapping a variable’s value in single (`'`) or double quotes (`"`):

{% include code.html language="liquid" code=examples.strings %}

### Number

Numbers include floats and integers:

{% include code.html language="liquid" code=examples.numbers %}

### Boolean

Booleans are either `true` or `false`. No quotations are necessary when declaring a boolean:

{% include code.html language="liquid" code=examples.booleans %}

### `nil`

`nil` is a special empty value that is returned when we have no results. It is not a string with the characters “nil”.

`nil` is treated as `false` in the conditions of [`if`](controls#if) blocks and other tags that check the truthfulness of a statement.

Tags or outputs that return `nil` will not print anything to the page.

{% include example.html example=examples.nil %}

### Arrays

Arrays hold lists of variables of any type. You can use square bracket `[ ]` notation to access a specific item in an array, and array indexing starts at zero.

{% include example.html example=examples.arrays %}

You cannot initialize arrays. You can, however, use the [`split`](filters) filter to break a string into an array of substrings.

## Truthy and falsey

Anything that returns `true` in a conditional is called _truthy_. Anything that returns `false` in a conditional is called _falsy_. All variables can be described as either truthy or falsy.

All values are truthy except `nil` and `false`, even empty strings, arrays, and zero.

<table class="table" cellspacing="0" cellpadding="0" border="0">
  <thead>
    <th>&nbsp;</th>
    <th>truthy</th>
    <th>falsy</th>
  </thead>
  <tbody>
    <tr>
      <td><code>true</code></td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><code>false</code></td>
      <td>&nbsp;</td>
      <td class="text-success">&check;</td>
    </tr>
    <tr>
      <td><code>nil</code></td>
      <td>&nbsp;</td>
      <td class="text-success">&check;</td>
    </tr>
    <tr>
      <td>string (e.g., <code>"foo"</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>empty string (i.e., <code>""</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>zero (i.e., <code>0</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>non-zero integer (e.g., <code>10</code> or <code>-10</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>non-zero float (e.g., <code>3.14</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>array (e.g., <code>["foo", "bar", "baz"]</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>empty array (e.g., <code>[]</code>)</td>
      <td class="text-success">&check;</td>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
