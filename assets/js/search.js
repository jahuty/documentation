document.addEventListener('DOMContentLoaded', () => {
  const searchClient = algoliasearch('FBGAMPVM3R', '298fd6759f35b3855571bfa3e61ffa9f');

  const search = instantsearch({
    indexName: 'docs_prod',
    searchClient,
  });

  search.addWidgets([
    instantsearch.widgets.searchBox({
      container: '#searchbox',
      autofocus: true,
      cssClasses: 'form-control'
    }),

    instantsearch.widgets.hits({
      container: '#hits',
      templates: {
        item: `
          <h5>
            <a href="{{ url }}">{{ title }}</a>
          </h5>
          <p>
            {{ excerpt_text }}
          </p>
        `,
      },
    })
  ]);

  search.start();

  // Remove the "search" text node that Algolia's searchBox widget inserts.
  document.getElementById('searchbox').previousSibling.remove();
});
