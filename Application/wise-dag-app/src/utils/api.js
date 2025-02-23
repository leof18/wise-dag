import axios from 'axios';

export const signup = (username, email, password) => {
  return axios.post('/api/auth/signup', { username, email, password });
};

export const login = (username, password) => {
  return axios.post('/api/auth/login', { username, password });
};

export const sendPasswordResetEmail = (email) => {
  return axios.post('/api/auth/reset-password', { email });
};

// Fetch nodes and edges based on granularity query
export const fetchGranularityQuery = async (selectedIterationId) => {
  try {
    const response = await fetch('http://localhost:3001/api/granularity-query', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        selectedIteration: { id: selectedIterationId }, // Granularity level 0
      }),
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching granularity query data:', error);
    throw error;
  }
};
