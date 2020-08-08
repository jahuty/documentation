---
title       : SDKs
description : All about SDKs.
keywords    : [choose, sdk]
category    : sdks
---

# Software Development Kits (SDKs)

A [Software Development Kit](https://en.wikipedia.org/wiki/Software_development_kit) (SDK) is an open-source software package that we maintain to make interacting with our API easier. Once installed and configured, an SDK provides objects and methods that abstract away low-level concerns like setting `Authorization` headers, encoding query string parameters, and parsing `json` responses.

All our SDKs have the following properties, unless otherwise noted:

* They are [open source](https://en.wikipedia.org/wiki/Open_source). You can open issues or submit pull requests through our [Github repositories](https://github.com/jahuty).
* They are [multi-platform](https://en.wikipedia.org/wiki/Cross-platform_software). You can use them equally well on Windows, Linux, and OSX.
* They are [semantically versioned](https://semver.org). You can assess compatibility between versions by their version number.
* They are [transparently changed](https://keepachangelog.com/en/1.0.0/). You can read what changes have been made in the repository's `CHANGELOG`.
* They are [easily installed](https://en.wikipedia.org/wiki/Package_manager). You can install from public repositories using your project's package manager.

## Language support

We offer SDKs for a growing number of languages and technologies. Some, but not all, languages have client- and server-side versions available.

Explore the following SDK reference guides for specific details about how to use Jahuty with your tech stack:

<table class="table table-bordered" cellspacing="0" cellpadding="0" border="0">
  <thead>
    <th>Language</th>
    <th>Server-side?</th>
    <th>Client-side?</th>
    <th>Repository</th>
    <th>Example</th>
  </thead>
  <tbody>
    <tr>
      <td>
        Ruby
      </td>
      <td>
        <span class="text-success">&check;</span>
      </td>
      <td>
        <span class="text-danger">&cross;</span>
      </td>
      <td>
        <a href="https://github.com/jahuty/jahuty-ruby">jahuty/jahuty-ruby</a>
      </td>
      <td>
        <a href="https://github.com/jahuty/jahuty-ruby-example">jahuty-ruby-example</a> (Rails)
      </td>
    </tr>
    <tr>
      <td>
        PHP
      </td>
      <td>
        <span class="text-success">&check;</span>
      </td>
      <td>
        <span class="text-danger">&cross;</span>
      </td>
      <td>
        <a href="https://github.com/jahuty/jahuty-php">jahuty/jahuty-php</a>
      </td>
      <td>
        <a href="https://github.com/jahuty/jahuty-php-example">jahuty-php-example</a> (Laravel)
      </td>
    </tr>
  </tbody>
</table>

## Choosing an SDK

We offer two types of SDKs: client-side and server-side.

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
