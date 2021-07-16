---
title       : Tags
description : Learning more about tags.
keywords    : [tags, create, update, delete]
permalink   : /components/:basename
category    : components
---
{% include heading.html title="Tags" lead="A tag is a short word or phrase used to group snippets and reduce load times." %}

Tags are short words or phrases that you can use to label and retrieve a group of snippets. You can tag snippets by domain, product, project, or anything else you'd like. To keep tags short and easy to remember, only lowercase letters, numbers, and hyphens are allowed.

Tags are especially useful when combined with our [SDKs]({% link sdks/overview.md %}) or [API]({% link api.html %}) to render a group of snippets with a single network request. Reducing the number of requests your application makes to our API for content improves your application's response time.

## Viewing tags

1. [Sign in]({{ site.data.urls.app.sign_in }}) to your account.
1. Click the _Tags_ link in the navigation on the left.

We'll call this your "tags dashboard", and the rest of this article will assume you're starting here.

Generally, it's a good idea to periodically curate your organization's collection of tags. Over time, similar-but-misspelled tags can accumulate, and unused or disused tags make it more difficult for your team to find the correct tag when searching.

## Creating tags

You can create a tag two ways: you can create a tag by itself, or you can create a tag by tagging a snippet.

To create a tag by itself:

1. Visit your [tags dashboard](#viewing-tags).
1. Click the _New tag_ button in the top-right of the page.
1. Fill in the tag's text.
1. Click the _Save tag_ button.

To create a tag by tagging a snippet:

1. [Sign in]({{ site.data.urls.app.sign_in }}) to your account.
1. Open a snippet.
1. Click the _Tags_ link beneath the snippet's name.
1. Fill in the tag's text.
1. Click the _Add tag_ button.

## Updating tags

To update a tag:

1. Visit your [tags dashboard](#viewing-tags).
1. Find the tag you'd like to update.
1. Click the tag's name link.
1. Fill in the tag's new text.
1. Click the _Save tag_ button.

Be careful updating a tag's text. If your application is using a tag to select a group of snippets, changing the tag's text will break the integration. Your code will no longer point to a tag in our system, and an exception will likely be raised.

## Deleting tags

To delete a tag:

1. Visit your [tags dashboard](#viewing-tags).
1. Find the tag you'd like to update.
1. Click the ellipsis (<i class="fa fa-ellipsis-h"></i>) at the end of the tag's row.
1. Click the _Delete_ link.
1. Click the confirmation's _Ok_ button.

Be careful deleting a tag. If your application is using a tag to select a group of snippets, deleting the tag will break the integration. Your code will no longer point to a tag in our system, and an exception will likely be raised.
