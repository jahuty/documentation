---
title       : Iterating a loop
description : How to iterate loops.
keywords    : [iterate, loop]
category    : liquid
---

{% assign examples = site.data.liquid.loops %}

# Iterating a loop

`For` loops allow you to run blocks of code repeatedly. You can change the loop's behavior with [control tags](#control-tags) and [parameters](#parameters), and within a loop, you can access [attributes](#attributes) to control the iteration.

Repeatedly executes a block of code while iterating over an array.

{% include example.html example=examples.for_array %}

You can also loop over a range of numbers. The range can be defined by both literal and variable numbers.

{% include example.html example=examples.for_range %}

## Control tags

Within the `for` loop, you can use the [`else`](#else), [`break`](#break), and [`continue`](#continue) tags to control the iteration.

### `else`

Specifies a fallback case for a `for` loop which will run if the loop has zero length.

{% include example.html example=examples.else %}

### `break`

Causes the loop to stop iterating and exit.

{% include example.html example=examples.break %}

### `continue`

Causes the loop to skip the current iteration.

{% include example.html example=examples.continue %}

## Parameters

You can pass [`limit`](#limit), [`offset`](#offset), and [`reversed`](#reversed) parameters into a `for` loop to change its starting position, ending position, or order, respectively.

### `limit`

Limits the loop to the specified number of iterations.

{% include example.html example=examples.limit %}

### `offset`

Begins the loop at the specified index.

{% include example.html example=examples.offset %}

### `reversed`

Reverses the order of the loop (note, this parameter’s spelling is different from the filter `reverse`).

{% include example.html example=examples.reversed %}

## Attributes

Within a `for` loop, the `forloop` object provides information about the loop.

{% include todo.html %}

{% comment %}
  <h3 id="attributes">
    Attributes
  </h3>
  <p>

  </p>
  <h4 id="forloop-first">
    <code>forloop.first</code>
  </h4>
  <p>
    Returns <code>true</code> if it's the first iteration of the for loop. Returns <code>false</code> if it is not the first iteration.
  </p>
  <%-
    input = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"] -->
      {% for product in products %}
        {% if forloop.first == true %}
          First time through!
        {% else %}
          Not the first time.
        {% endif %}
      {% endfor %}
    CODE

    output = <<~CODE
      First time through!
      Not the first time.
      Not the first time.
    CODE

  %>
  <%= render "application/input_and_output", { input: input, output: output } %>
  <h4 id="forloop-index">
    <code>forloop.index</code>
  </h4>
  <p>
    Returns the current index of the <code>for</code> loop, starting at 1.
  </p>
  <%-
    input = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"] -->
      {% for product in products %}
        {{ forloop.index }}
      {% endfor %}
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: "1 2 3" } %>
  <h4  id="forloop-index0">
    <code>forloop.index0</code>
  </h4>
  <p>
    Returns the current index of the <code>for</code> loop, starting at 0.
  </p>
  <%-
    example = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"] -->
      {% for product in products %}
        {{ forloop.index0 }}
      {% endfor %}
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: "0 1 2" } %>
  <h4  id="forloop-last">
    <code>forloop.last</code>
  </h4>
  <p>
    Returns <code>true</code> if it's the last iteration of the <code>for</code> loop. Returns <code>false</code> if it is not the last iteration.
  </p>
  <%-
    input = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"] -->
      {% for product in products %}
        {% if forloop.last == true %}
          This is the last iteration!
        {% else %}
          Keep going...
        {% endif %}
      {% endfor %}
    CODE

    output = <<~CODE
      Keep going...
      Keep going...
      This is the last iteration!
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: output } %>
  <h4 id="forloop-length">
    <code>forloop.length</code>
  </h4>
  <p>
    Returns the number of iterations of the loop.
  </p>
  <%-
    input = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"] -->
      {% for product in products %}
        {% if forloop.first %}
          <p>This collection has {{ forloop.length }} products:</p>
        {% endif %}
        <p>{{ product }}</p>
      {% endfor %}
    CODE

    output = <<~CODE
      This collection has 3 products:
      Hat
      Shirt
      Pants
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: output } %>
  <h4 id="forloop-rindex">
    <code>forloop.rindex</code>
  </h4>
  <p>
    Returns <a href="#forloop-index"><code>forloop.index</code></a> in reverse order.
  </p>
  <%-
    input = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"]
      {% for product in products %}
        {{ forloop.rindex }}
      {% endfor %}
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: "3 2 1" } %>
  <h4 id="forloop-rindex0">
    <code>forloop.rindex0</code>
  </h4>
  <p>
    Returns <a href="#forloop-index0"><code>forloop.index0</code></a> in reverse order.
  </p>
  <%-
    input = <<~CODE
      <!-- if products = ["hat", "shirt", "pants"]
      {% for product in products %}
        {{ forloop.rindex0 }}
      {% endfor %}
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: "2 1 0" } %>
  <h2>
    <code>cycle</code>
  </h2>
  <p>
    Loops through a group of strings in a <code>for</code> loop and prints them in the order that they were passed as arguments. Each time <code>cycle</code> is called, the next string argument is printed.
  </p>
  <%-
    input = <<~CODE
      {% for i in (1..3) %}
        {% cycle "one", "two", "three" %}
      {% endfor %}
    CODE

    output = <<~CODE
      one
      two
      three
    CODE
  %>
  <%= render "application/input_and_output", { input: input, output: output } %>

  <%= render "application/next_doc", {
    lead: "That's it for snippets, unless you're ready to remove one.",
    text: "Removing a snippet",
    path: docs_removing_a_snippet_path
  } %>
{% endcomment %}
