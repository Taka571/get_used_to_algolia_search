import React from 'react';
import algoliasearch from 'algoliasearch/lite';
import { InstantSearch, SearchBox, Hits } from 'react-instantsearch-dom';

const searchClient = algoliasearch(
  process.env.ALGOLIA_APPLICATION_ID,
  process.env.ALGOLIA_API_KEY
);

const App = () => (
  <InstantSearch
    indexName="Product_development"
    searchClient={searchClient}
  >
    <SearchBox />
    <Hits />
  </InstantSearch>
);

export default App;
