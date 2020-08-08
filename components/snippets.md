---
title       : Snippets
description : All about snippets.
category    : components
---
{% comment %}
  Creating > Retrieving > Rendering > Removing > Deleting
{% endcomment %}

# Snippets

A snippet is a small [HTML5](https://en.wikipedia.org/wiki/HTML5) template. It can be any valid HTML chunk you'd like to extract, outsource, or share like plain-text, an `p` element, a page of content, or whatever else you'd like. Snippets are assigned a unique `id` number; shared by an [organization](/components/organizations); and, pulled into your websites and applications via an [SDK](/sdks) or [API](/api).

## Creating a snippet

To create a snippet:

1. [Sign in]({{ site.data.urls.app.sign_in }}) to your account.
1. Click the "New snippet" button.
1. Enter a name for your snippet to help tell them apart.
1. Create your snippet's content using the [text editor](#text-editor) and [template language](#template-language).

That's it! Your changes will be automatically saved and published.

## Text editor

{% include todo.html %}

## Template language

Snippets don't have to be static content. Using the Liquid template language, the _same snippet_ can produce _different output_ using the [Liquid](/liquid/introduction) template language and [dynamic parameters](/liquid/parameters).

{% include example.html example=site.data.liquid.parameters.introduction1 %}

The Liquid language is too powerful to cover in detail sufficiently here. Instead, we've dedicated a whole section to learning more about [Liquid](/liquid/introduction).

## Rendering a snippet

{% include todo.html %}

## Removing a snippet

{% include todo.html %}

## Deleting a snippet

{% include todo.html %}
