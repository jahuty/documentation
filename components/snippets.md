---
title       : Snippets
description : All about snippets.
category    : components
---
{% comment %}
  Creating > Retrieving > Rendering > Removing > Deleting
{% endcomment %}

{% include heading.html title="Snippets" lead="A chunk of managed content you can render anywhere." %}

A snippet is a document that's created in our text editor and output wherever you need it.

* Snippets are shared by an [organization](organizations). Anyone in your organization can edit your snippets.
* Snippets are assigned an `id`, a unique identifier, which you can use to refer to a snippet.
* Snippets are pulled into your websites and applications using our [SDKs](/sdks) or [API](/api).

## Creating a snippet

To create a snippet:

1. [Sign in]({{ site.data.urls.app.sign_in }}) to your account.
1. Click the "New snippet" button.
1. Create your snippet's content using the [text editor](#using-the-text-editor) and [template language](#using-the-template-language).

That's it! As you write, your changes will be automatically saved and available everywhere your snippet is used.

## Using the text editor

Our rich text editor emulates familiar document software like Google Docs or Microsoft Word. You can write text and format it, of course. You can drag-and-drop, upload, or copy-paste images, then align, resize, and caption them. You can highlight any text or images to add comments and start a conversation with colleagues. You can also suggest insertions and deletions for your colleagues to accept or reject.

## Using the template language

Snippets don't have to be just text. Using our template language, the _same snippet_ can produce _different output_ using  [Liquid](/liquid/introduction) syntax and [dynamic parameters](/liquid/parameters). This allows you to create powerful, reusable [templates](/liquid/introduction).

{% include example.html example=site.data.liquid.parameters.introduction1 %}

## Rendering a snippet

When you retrieve a snippet, we'll combine the snippet's source code and the parameters you've passed to generate a render. This render is the HTML we'll send to you.

The first time you render a snippet, it may take a bit longer, because we have a lot to do. After that, however, we'll return a cached version of the snippet much more quickly.

Whenever you change your snippet's content, the cache will be invalidated, and a new render will be generated.

## Removing a snippet

Once your content stabilizes, you can replace a snippet with its source code to improve your page's performance (no matter how fast we make our service, loading static content locally will always be faster).

To remove a snippet:

1. Open your snippet.
1. Get its identifier.
1. Retrieve the snippet using the identifier and its final parameters.
1. Find occurrences of the snippet in your application.
1. Replace the occurrences of the snippet with the snippet's source code.

## Deleting a snippet

Currently, you can't delete a snippet from our application, but we're working on it!
