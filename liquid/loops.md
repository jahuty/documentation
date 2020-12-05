---
title       : Iterating a loop
description : How to iterate loops.
keywords    : [iterate, loop]
category    : liquid
---

{% assign examples = site.data.liquid.loops %}

{% include heading.html title="Iterating a loop" lead="Run blocks of code repeatedly." %}

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

### `forloop.first`

Returns `true` if it's the first iteration of the for loop. Returns `false` otherwise.

{% include example.html example=examples.forloop_first %}

### `forloop.index`

Returns the current index of the `for` loop, starting at 1.

{% include example.html example=examples.forloop_index %}

### `forloop.index0`

Returns the current index of the `for` loop, starting at 0.

{% include example.html example=examples.forloop_index0 %}

### `forloop.last`

Returns `true` if it's the last iteration of the `for` loop. Returns `false` otherwise.

{% include example.html example=examples.forloop_last %}

### `forloop.length`

Returns the number of iterations of the loop.

{% include example.html example=examples.forloop_length %}

### `forloop.rindex`

Returns [`forloop.index`](#forloopindex) in reverse order.

{% include example.html example=examples.forloop_rindex %}

### `forloop.rindex0`

Returns [`forloop.index0`](#forloopindex0) in reverse order.

{% include example.html example=examples.forloop_rindex0 %}
