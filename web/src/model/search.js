const API_KEY = "5369fff1d1mshf099e79a1585533p17ba80jsn9f18a63e60d8"

const BASE_API_URL = 'https://tasty.p.rapidapi.com/recipes/list'

const getRecipes = async (query, time) => {
    const response = await fetch(`${BASE_API_URL}?from=0&size=20&tags=${time}&q=${query}`, {
        method: 'GET',
        headers: {
        'X-RapidAPI-Key': API_KEY,
        'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
        }
    })
    
    const data = await response.json()
    
    return data.results
    }

export default getRecipes