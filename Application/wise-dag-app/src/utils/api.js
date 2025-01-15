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
