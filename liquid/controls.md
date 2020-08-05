---
title       : Controlling the flow
description : How to control the flow
keywords    : [liquid, control, flow]
---
{% assign examples = site.data.liquid.controls %}

# Controlling the flow

Operators and control flow tags use logic to follow different code paths in your templates. They are denoted by curly braces and percent signs: {% raw %}`{%` and `%}`{% endraw %}.

{% include example.html example=examples.introduction %}

The markup used in tags does not produce any visible text, but it will still print a blank line in your rendered HTML. Include a hyphen in your tag syntax {% raw %}`{%-` and `-%}`{% endraw %}, and we'll strip the generated whitespace from your HTML.

## Operators

Operators are useful for testing logic and performing comparisons.

<table class="table" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
      <td><code>==</code></td>
      <td>equals</td>
    </tr>
    <tr>
      <td><code>!=</code></td>
      <td>does not equal</td>
    </tr>
    <tr>
      <td><code>&gt;</code></td>
      <td>greater than</td>
    </tr>
    <tr>
      <td><code>&lt;</code></td>
      <td>less than</td>
    </tr>
    <tr>
      <td><code>&gt;=</code></td>
      <td>greater than or equal to</td>
    </tr>
    <tr>
      <td><code>&lt;=</code></td>
      <td>less than or equal to</td>
    </tr>
    <tr>
      <td><code>or</code></td>
      <td>logical or</td>
    </tr>
    <tr>
      <td><code>and</code></td>
      <td>logical and</td>
    </tr>
    <tr>
      <td><code>contains</code></td>
      <td>checks for the presence of a substring</td>
    </tr>
    <tr>
      <td><code>increment</code></td>
      <td>creates a new variable equal to 0 and increases its value by one</td>
    </tr>
    <tr>
      <td><code>decrement</code></td>
      <td>creates a new variable equal to -1 and decreases its value by one</td>
    </tr>
  </tbody>
</table>

You can use multiple operators in a tag. In tags with more than one `and` or `or` operator, operators are checked in order from right to left. You cannot change the order of operations using parentheses — parentheses are invalid characters and will prevent your tags from working.

### `contains`

Checks for the presence of a substring inside a string.

{% include example.html example=examples.contains_string %}

It can also check for the presence of a string in an array of strings.

{% include example.html example=examples.contains_array %}

Keep in mind, `contains` can only search strings. You cannot use it to check for an object in an array of objects.

### `increment`

Creates a new number variable, and increases its value by one every time it is called. The initial value is 0. Unlike other operators which require two operands, `increment` only requires one.

{% include example.html example=examples.increment %}

Variables created through the `increment` tag are independent from variables created through [`assign`](variables#assign) or [`capture`](variables#capture). In the example below, a variable named `var` is created through `assign`. The `increment` tag is then used several times on a variable with the same name. Note that the `increment` tag does not affect the value of `var` that was created through `assign`.

{% include example.html example=examples.increment_independence %}

### `decrement`

Creates a new number variable, and decreases its value by one every time it is called. The initial value is -1.

{% include example.html example=examples.decrement %}

Like [`increment`](#increment), variables declared inside `decrement` are independent from variables created through [`assign`](variables#assign) or [`capture`](variables#capture).

## Control flow tags

Control flow tags can change the information you show using programming logic.

### `if`

Executes a block of code only if a certain condition is `true` or evaluates to ["truthy"](variables#truthy-and-falsey).

{% include example.html example=examples.if %}

### `unless`

Executes a block of code only if a certain condition is `false` or evaluates to ["truthy"](variables#truthy-and-falsey) - the opposite of `if`.

{% include example.html example=examples.unless %}

This would be the equivalent of the following:

{% include example.html example=examples.unless_as_if %}

### `elsif/else`

Adds more conditions within an `if` or `unless` block.

{% include example.html example=examples.else %}

### `case/when`

Creates a `switch` statement to compare a variable with different values. `case` initializes the `switch` statement, and `when` compares its values.

{% include example.html example=examples.case %}

### `raw`

Temporarily disables tag processing. This is useful for generating content (e.g., Mustache, Handlebars) which uses conflicting syntax.

{% include example.html example=examples.raw %}

### `comment`

Allows you to leave un-rendered code inside a template. Any text within the opening and closing comment blocks will not be printed, and any template code within will not be executed.

{% include example.html example=examples.comment %}
