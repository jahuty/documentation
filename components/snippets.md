---
title       : Snippets
description : All about snippets.
keywords    : [snippets]
permalink   : /components/:basename
category    : components
---
{% comment %}
  Creating > Retrieving > Rendering > Removing > Deleting
{% endcomment %}

{% include heading.html title="Snippets" lead="A chunk of dynamic content you can render anywhere." %}

A snippet is created in our text editor and output wherever you need it:

* Snippets are shared by an [organization](organizations), and anyone in the organization can edit its snippets.
* Snippets are assigned an `id`, a unique, permanent identifier, which you can use to refer to it.
* Snippets are output in your application using our [SDKs]({% link sdks/overview.md %}) or [API]({% link api.html %}).

## Viewing snippets

To view your organization's snippets, [sign in]({{ site.data.urls.app.sign_in }}) to your account, and we'll automatically direct you to your current organization's snippets.

We'll call this your "Snippets dashboard", and the rest of this article will assume you're starting here.

If you ever get lost, you can return to your snippets dashboard by clicking _Jahuty_ in the top left of the navigation menu.

## Creating snippets

When you create your account, we'll automatically create two snippets for you to get started.

To create a new snippet:

1. Visit your [snippet dashboard](#viewing-snippets).
1. Click the _New snippet_ button in the top right.

Our text editor works like Google Docs or Microsoft Word:

* Click anywhere and start typing.
* Highlight any text, and use the menu that pops up to format your text. You can use the same menu to add comments, track changes, and more.
* Drag-and-drop, upload, or copy-paste images. You can use the menu that pops up around an image to align, resize, and caption it.
* Click (or hover) on red-underlined words for spelling suggestions and blue-underlined words for grammar suggestions.

Of course, snippets don't have to be just text. Using our template language, the _same snippet_ can produce _different output_ using  [Liquid](/liquid/introduction) syntax and [dynamic parameters](/liquid/parameters). This allows you to create powerful, reusable [templates](/liquid/introduction).

For example:

{% include example.html example=site.data.liquid.parameters.introduction1 %}

## Publishing snippets

When your content is ready to be released, press the _Publish_ button. This is the content version we'll use by default when rendering your snippet.

You can continue to make changes to your content, of course, and these changes will be staged until the next time you press the _Publish_ button.

## Rendering snippets

When you render a snippet through our [SDKs]({% link sdks/overview.md %}) or [API]({% link api.html %}), we'll combine the snippet's content with the parameters you've passed to generate a render. Then, we'll send the resulting HTML to you in Unicode-escaped format.

By default, we'll render the snippet's _published_ content. However, if you would like to render a snippet's _latest_ content, which can include unpublished changes, you can configure your SDK to do so.

The first time you render a snippet, it may take a bit longer, because we have a lot to do. After that, however, we'll return a cached version of the snippet much more quickly.

Whenever you change your snippet's content, the cache will be invalidated, and a new render will be generated upon the next request.

## Removing snippets

Once your content stabilizes, you can replace a snippet with its source code to improve your page's performance (no matter how fast we make our service, loading static content locally will always be faster).

To remove a snippet:

1. Copy the snippet's resulting HTML from your application's source code.
1. Find occurrences of the snippet in your application.
1. Replace the occurrences of the snippet with the snippet's source code.

## Deleting snippets

At this time, you cannot delete a snippet through the application. Instead, please [contact us]({{ site.data.urls.contact }}) for assistance.
