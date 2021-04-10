---
title       : API keys
description : Learning more about API keys.
keywords    : [manage, api, key]
permalink   : /components/:basename
category    : components
---
{% include heading.html title="API Keys" lead="Long, impossible-to-guess strings that identify your organization's API requests." %}

[_API keys_](https://en.wikipedia.org/wiki/Application_programming_interface_key) are long, impossible-to-guess strings of letters and numbers that Jahuty uses to identify your organization's API requests. If you do not include a key when making an [API request](/api#authentication), you include one incorrectly, or use one that is incorrect or outdated, Jahuty will return an error.

## Types of API keys

There are two types of API keys: _public_ and _secret_.

* **Public** API keys are meant solely to identify your organization's account with Jahuty and have limited permissions. They aren’t secret. In other words, they can safely be published in places like your client-side SDK, or in an Android or iPhone app.
* **Secret** API keys, on the other hand, should be kept confidential, stored on your own servers, and only used in a server-side SDK. Secret API keys are secret, because they can perform more API requests than a _public_ one.

Every organization is provided with a temporary, public "Default API Key" on account creation, which expires at the end of their free trial.

## Securing API keys

Take care to keep your _secret_ API keys secure. They can be used to make API calls on behalf of your account, and publicly exposing your secret credentials can result in your account being compromised. Treat your secret API key as you would any other password.

To help keep your API keys secure, follow these best practices:

* Ensure keys are kept out of your version control system. If you store API keys in files, keep the files outside your application's source tree. Otherwise, anyone with access to your repository - contributors, vendors, etc -  has access to your keys.
* Give each integration its own API key, and name each key so you know which key goes with which application. If a specific API key is compromised, you can disable that key without disabling access to all of your other integrations.
* Grant access to your keys only to those who need it using a [password manager](https://en.wikipedia.org/wiki/List_of_password_managers) or [secrets management service](https://en.wikipedia.org/wiki/Key_management#Non-KMIP-compliant_key_management).
* Be careful not to expose the key to the public (such as in screenshots, videos, or help documentation). Remember that blurring your data isn't always enough.
* If a key needs to be shared, generate a new key and name it accordingly so it can be disabled, if needed. Never email the API key, because it would allow access to your Jahuty account if hackers were to compromise your email account.
* Roll your API keys periodically and update your applications to use the newly-generated keys. Your old keys will continue to work for 12 hours after you generate replacement keys.
* Delete unneeded API keys to minimize exposure to attacks.

## Viewing API keys

To view your organization's API keys:

1. [Sign in]({{ site.data.urls.app.sign_in }}) to your account.
1. Click the chevron-down icon (<i class="fa fa-chevron-down"></i>) next to your organization's name in the left navigation.
1. Click the _Settings_ link in the dropdown.
1. Click the _API keys_ link in in the left navigation.

The rest of this article will assume you're starting from this point, which we'll call your "API keys dashboard".

## Creating API keys

To create an API key:

1. Visit your [API key dashboard](#viewing-api-keys).
1. Click the _New API key_ button in the top right.
1. Fill in the API key's name to help distinguish it from your other keys.
1. Fill in an expiration date, if you like (by default, keys don't expire until rolled or deleted).
1. Click the _Save API key_ button.
1. Copy the key in the alert message (paste it somewhere safe, because it cannot be retrieved again).

A notification will automatically be sent to your organization's owners notifying them a new API key has been created.

## Editing API keys

To edit an API key's name or expiration date:

1. Visit your [API key dashboard](#viewing-api-keys).
1. Find the API key you would like to edit.
1. Click the API key's name link.
1. Fill in the API key's name or expiration date.
1. Click the _Save API key_ button.

## Rolling API keys

Periodically refreshing your API keys makes your application a moving target and disables any keys which may have been compromised without your knowledge. Rolling an API keys gives you a 12-hour window to update your application to use a newly-generated key before the old one expires.

To roll an API key:

1. Visit your [API key dashboard](#viewing-api-keys).
1. Find the API key you would like to roll.
1. Click the ellipsis icon (<i class="fa fa-ellipsis-h"></i>) at the end of its row.
1. Click the _Roll_ link in the dropdown menu.

## Deleting API keys

If an API key is no longer needed (or you suspect it's been compromised), you should delete it. Deleting a key immediately revokes its access and any further use will return an error.

To delete an API key:

1. Visit your [API key dashboard](#viewing-api-keys).
1. Find the API key you would like to delete.
1. Click the ellipsis icon (<i class="fa fa-ellipsis-h"></i>) at the end of its row.
1. Click the _Delete_ link in the dropdown menu.
1. Click _Ok_ to confirm the key's deletion.
