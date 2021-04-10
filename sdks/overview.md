---
title       : SDKs
description : All about SDKs.
keywords    : [choose, sdk]
permalink   : /sdks/:basename
category    : sdks
---

{% include heading.html title="Choosing an SDK" lead="Packages we maintain to make interacting with our API easier." %}

A [Software Development Kit](https://en.wikipedia.org/wiki/Software_development_kit) (SDK) is an open-source software package we maintain that makes interacting with our API easier. Once installed and configured, an SDK provides objects and methods that abstract away low-level concerns like setting `Authorization` headers, encoding query string parameters, and parsing `json` responses.

SDKs are available in the language of your choice including: [Node.js]({% link sdks/node.md %}), [PHP]({% link sdks/php.md %}), [Ruby]({% link sdks/ruby.md %}), and the [web]({% link sdks/web.md %}).

All our SDKs have the following properties, unless otherwise noted:

* They are [open source](https://en.wikipedia.org/wiki/Open_source). Inspect code or contribute via our [Github repositories](https://github.com/jahuty).
* They are [multi-platform](https://en.wikipedia.org/wiki/Cross-platform_software). They work equally well on Windows, Linux, and OSX.
* They are [semantically versioned](https://semver.org). Version numbers indicate compatibility between versions.
* They are [transparently changed](https://keepachangelog.com/en/1.0.0/). Notable changes are curated in a `CHANGELOG`.
* They are [easily installed](https://en.wikipedia.org/wiki/Package_manager). Install from public repositories using your project's package manager.

## Choosing an SDK

We offer two types of SDKs: _client-side_ and _server-side_.

<table class="table table-bordered" cellspacing="0" cellpadding="0" border="0">
  <thead>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">Client-side SDKs</th>
      <th scope="col">Server-side SDKs</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td scope="row">
        Location
      </td>
      <td>
        Browsers or mobile devices
      </td>
      <td>
        Corporate networks or web servers
      </td>
    </tr>
    <tr>
      <td scope="row">
        Installation
      </td>
      <td colspan="2">
        Package manager
      </td>
    </tr>
    <tr>
      <td>
        Function
      </td>
      <td colspan="2">
        Feature parity <span class="text-muted">(although, slight differences may exist)</span>
      </td>
    </tr>
    <tr>
      <td>
        Security
      </td>
      <td>
        Can be inspected by end user
      </td>
      <td>
        Cannot be inspected by end user
      </td>
    </tr>
    <tr>
      <td>
        Secret keys
      </td>
      <td>
        No, never!
      </td>
      <td>
        Yes
      </td>
    </tr>
    <tr>
      <td>
        Versioning
      </td>
      <td colspan="2">
        Semantic versioning
      </td>
    </tr>
  </tbody>
</table>

## Security considerations

The biggest difference between client- and server-side SDKs is security. Because you cannot use secret keys in a client-side SDK, you will not be able to use riskier API features.

Client-side SDKs typically run on customers' own devices. They can be compromised by users who unpack a mobile app to examine the SDK bytecode or use their browser's developer tools to inspect internal site data. As a result, you should never use a [secret API key](/components/api-keys) in a client-side or mobile application.

Server-side SDKs, on the other hand, operate within server-architected applications running on your own infrastructure or trusted cloud-based infrastructure. Neither of these locations is directly accessible by end users. Because of the limited access to server-based applications, our secret API keys can safely retrieve snippets without needing to obscure or filter out sensitive data.

## Language support

We offer SDKs in a growing number of languages and technologies. Explore the following SDK reference guides for specific details about how to use Jahuty with your tech stack.

<table class="table table-bordered" cellspacing="0" cellpadding="0" border="0">
  <thead>
    <th>Language</th>
    <th>Server-side?</th>
    <th>Client-side?</th>
    <th>Repository</th>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="{% link sdks/node.md %}">Node.js</a>
      </td>
      <td>
        <span class="text-success">&check;</span>
      </td>
      <td>
        <span class="text-danger">&cross;</span>
      </td>
      <td>
        <a href="{{ site.data.urls.sdks.node }}">jahuty/jahuty-node</a>
      </td>
    </tr>
    <tr>
      <td>
        <a href="{% link sdks/ruby.md %}">Ruby</a>
      </td>
      <td>
        <span class="text-success">&check;</span>
      </td>
      <td>
        <span class="text-danger">&cross;</span>
      </td>
      <td>
        <a href="{{ site.data.urls.sdks.ruby }}">jahuty/jahuty-ruby</a>
      </td>
    </tr>
    <tr>
      <td>
        <a href="{% link sdks/php.md %}">PHP</a>
      </td>
      <td>
        <span class="text-success">&check;</span>
      </td>
      <td>
        <span class="text-danger">&cross;</span>
      </td>
      <td>
        <a href="{{ site.data.urls.sdks.php }}">jahuty/jahuty-php</a>
      </td>
    </tr>
    <tr>
      <td>
        <a href="{% link sdks/web.md %}">Web</a>
      </td>
      <td>
        <span class="text-danger">&cross;</span>
      </td>
      <td>
        <span class="text-success">&check;</span>
      </td>
      <td>
        <a href="{{ site.data.urls.sdks.web }}">unpkg.com</a>
      </td>
    </tr>
  </tbody>
</table>
