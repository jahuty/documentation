---
title       : Getting started
description : Getting started with Jahuty.
keywords    : [getting, started]
category    : getting-started
javascripts :
  - src: /assets/js/toggle.js
---
{% include heading.html title="Getting started" lead="Welcome to Jahuty! We're excited to partner with you and help your team save tons of time. We know how difficult managing content in an application can be." %}

Here's what you need to do:

1. [Create your account](#create-your-account).
1. [Open your first snippet](#open-your-first-snippet).
1. [Install your first SDK](#install-your-first-sdk).
1. [Render your first snippet](#render-your-first-snippet).

## Create your account

Use the [registration form]({{ site.data.urls.app.sign_up }}) to create your Jahuty _account_. An account allows personalized access to our application. Be sure to use a strong password: your account is you, and your account is your password. Also, don't worry about your personal data: we make money by providing a great service, not selling data.

When you create your account, we'll create an _organization_ for you. An organization is a place where one or more people work together in Jahuty. Nearly everything in Jahuty is associated with an organization, including your account.

The organizations you belong to and the roles you are assigned within them determine what you can do in Jahuty. You can invite members to the organization we've created for you by sending [invitations](/components/invitations), or you can receive invitations from other organization owners.

## Open your first snippet

When you created your account, we created a _snippet_ for you. A snippet is a chunk of content your team would like to manage and share. It's like a Google Doc or Word Document, except what you write will appear in your application.

Snippets are more than just text. You can use the [Liquid templating language](/liquid/introduction) to add variables, filters, controls, and more. And, by using variables and [parameters](/liquid/parameters) together, you can create templates that produce different output using the same snippet.

## Install your first SDK

A [Software Development Kit (SDK)](/sdks) is an open source package we maintain to make interacting with [our API](/api) easier. SDKs provide objects and methods that abstract away our API's lower-level request/response details. SDKs are available in a number of languages, and you can choose the one that fits your stack.

<div class="card mb-4">
  <div class="card-header">
    <nav class="nav nav-pills nav-fill">
      <a class="nav-link active" data-toggle-type="activity" data-toggle-language="bash">cURL</a>
      <a class="nav-link" data-toggle-type="activity" data-toggle-language="php">PHP</a>
      <a class="nav-link" data-toggle-type="activity" data-toggle-language="ruby">Ruby</a>
    </nav>
  </div>
  <div class="card-body text-muted">
    <p class="m-0" data-toggle-type="visibility" data-toggle-language="bash">
      By default, our examples use <code>curl</code> and test sample data to interact with our API over HTTPS. Select one of our official SDKs to see examples in code.
    </p>
    <p class="m-0" data-toggle-type="visibility" data-toggle-language="php">
      <code>$ composer require jahuty/jahuty-php</code> <a href="https://github.com/jahuty/jahuty-php" target="_blank"><i class="fab fa-github ml-2"></i></a>
    </p>
    <p class="m-0" data-toggle-type="visibility" data-toggle-language="ruby">
      <code>$ gem install jahuty</code> <a href="https://github.com/jahuty/jahuty-ruby" target="_blank"><i class="fab fa-github ml-2"></i></a>
    </p>
  </div>
</div>

## Render your first snippet

{% assign example_id = 1 %}
{% assign example_api_key = "kn2Kj5ijmT2pH6ZKqAQyNexUqKeRM4VG6DDgWN1lIcc" %}

To render your first snippet, you'll need two values:

1. Your snippet's _id_. This is the number beside your snippet's name in the editor.
1. Your organization's _API key_. There's a temporary one in your welcome email.

(In the examples below, we've used a sample test id and API key to provide a working example. To render your first snippet, however, you should replace the sample API key and snippet id with your actual values.)

{% capture bash %}
curl https://api.jahuty.com/snippets/{{ example_id }}/render \
  -H "Authorization: Bearer {{ example_api_key }}"; \
  echo
{% endcapture %}

{% capture php %}
use Jahuty\Jahuty\{Jahuty, Snippet};

Jahuty::setKey('{{ example_api_key }}');

echo Snippet::render({{ example_id }});
{% endcapture %}

{% capture ruby %}
require "Jahuty"

Jahuty.key = "{{ example_api_key }}"

puts Jahuty::Snippet.render {{ example_id }}
{% endcapture %}

<div class="card mb-4">
  <div class="card-header">
    <nav class="nav nav-pills nav-fill">
      <a class="nav-link active" data-toggle-type="activity" data-toggle-language="bash">cURL</a>
      <a class="nav-link" data-toggle-type="activity" data-toggle-language="php">PHP</a>
      <a class="nav-link" data-toggle-type="activity" data-toggle-language="ruby">Ruby</a>
    </nav>
  </div>
  <div class="card-body text-muted">
    <div data-toggle-type="visibility" data-toggle-language="bash">
      {% highlight bash %}{{ bash }}{% endhighlight %}
    </div>
    <div data-toggle-type="visibility" data-toggle-language="php">
      {% highlight php %}{{ php }}{% endhighlight %}
    </div>
    <div data-toggle-type="visibility" data-toggle-language="ruby">
      {% highlight ruby %}{{ ruby }}{% endhighlight %}
    </div>
  </div>
</div>

## That's it!

We hope you've enjoyed getting started with Jahuty! If you have any questions, [let us know]({{ site.data.urls.contact }}). Otherwise, feel free to learn more about Jahuty's [components]({% link components/overview.md %}), [using templates]({% link liquid/introduction.md %}), [choosing an SDK]({% link sdks.md %}), or [using our API]({% link api.html %}).
