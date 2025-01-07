// src/utils/api.js
import axios from 'axios';

const API = axios.create({
  baseURL: 'http://localhost:3001/api',
});

export const loginUser = async (email, password) => {
  return API.post('/auth/login', { email, password });
};

export const signupUser = async (email, password) => {
  return API.post('/auth/signup', { email, password });
};
