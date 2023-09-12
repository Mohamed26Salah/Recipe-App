import React, { useState } from 'react';
import '../css/search.css';
import getRecipes from '../model/search';

const Search = () => {
    const [selected, setSelected] = useState(0);
    const [searchResults, setSearchResults] = useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [loading, setLoading] = useState(false);
    const time = ['under_15_minutes', 'under_30_minutes', 'under_1_hour'];

  const handleSelect = (e) => {
    setSelected(e);
  };

  const handleSearch = async () => {
    try {
      setLoading(true); // Set loading to true while fetching data
      const results = await getRecipes(searchQuery, time[selected]);
      setSearchResults(results);
    } catch (err) {
      console.log(err);
    } finally {
      setLoading(false); // Set loading to false when the fetch is done
    }
  };

  const handleInputChange = (e) => {
    setSearchQuery(e.target.value);
  };

  const handleInputKeyUp = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  return (
    <div className="search-container">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search"
          value={searchQuery}
          onChange={handleInputChange}
          onKeyUp={handleInputKeyUp}
        />
        <button onClick={handleSearch}>
        <svg width="30" height="30" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M39.4384 36.6278L32.0228 29.2666C34.9013 25.6749 36.2952 21.1159 35.9181 16.5271C35.5409 11.9384 33.4213 7.66863 29.995 4.59585C26.5687 1.52306 22.0963 -0.119199 17.4972 0.00674304C12.8982 0.132685 8.52218 2.01726 5.26895 5.27295C2.01573 8.52865 0.132584 12.908 0.00673792 17.5105C-0.119108 22.1131 1.52191 26.5889 4.59236 30.0178C7.66281 33.4467 11.9293 35.5679 16.5146 35.9454C21.0999 36.3228 25.6554 34.9278 29.2444 32.0471L36.6 39.4083C36.7859 39.5958 37.0069 39.7446 37.2505 39.8462C37.4941 39.9477 37.7553 40 38.0192 40C38.2831 40 38.5443 39.9477 38.7879 39.8462C39.0315 39.7446 39.2525 39.5958 39.4384 39.4083C39.7986 39.0353 40 38.5368 40 38.0181C40 37.4993 39.7986 37.0008 39.4384 36.6278ZM18.0311 32.0471C15.2638 32.0471 12.5586 31.2259 10.2577 29.6873C7.9568 28.1487 6.16345 25.9618 5.10445 23.4032C4.04546 20.8446 3.76837 18.0292 4.30825 15.3131C4.84812 12.5969 6.1807 10.1019 8.13747 8.14365C10.0942 6.18539 12.5873 4.8518 15.3014 4.31152C18.0156 3.77124 20.8288 4.04853 23.3855 5.10833C25.9421 6.16813 28.1273 7.96284 29.6647 10.2655C31.2022 12.5682 32.0228 15.2754 32.0228 18.0448C32.0228 21.7584 30.5486 25.32 27.9247 27.9459C25.3007 30.5719 21.7419 32.0471 18.0311 32.0471Z" fill="#626262"/>
        </svg>
        </button>
      </div>
      <div className="filter-container">
        <button className={selected === 0 ? "selected" : "unselected"} onClick={() => handleSelect(0)}>Under 15 minutes</button>
        <button className={selected === 1 ? "selected" : "unselected"} onClick={() => handleSelect(1)}>Under 30 minutes</button>
        <button className={selected === 2 ? "selected": "unselected"} onClick={() => handleSelect(2)}>Under 1 hour</button>
      </div>
      <div className='results-container'>
      {loading ? (
          <div className="loading-screen">
            <div className="loading-spinner"></div>
            <p>Loading...</p>
          </div>
        ) : (
          searchResults.length > 0 ? (
            searchResults.map((result, index) => (
              <div className="result" key={index}>
                <img src={result.thumbnail_url} alt={result.name} />
                <div className="result-info">
                  <h3>{result.name}</h3>
                  <p>{result.description.length > 155? result.description.substring(0,100) + "...":result.description}</p>
                </div>
              </div>
            ))
          ) : (
            <h3 className="emptySearch">Use the search bar to view recipes...</h3>
          )
        )}
      </div>
    </div>
  );
};

export default Search;
