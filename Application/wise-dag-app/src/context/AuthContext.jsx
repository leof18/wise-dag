import React, { createContext, useState, useContext } from 'react';
import { signup as apiSignup, login as apiLogin, sendPasswordResetEmail } from '../utils/api';
import { useNavigate } from 'react-router-dom';

export const AuthContext = createContext();

export const useAuth = () => {
  return useContext(AuthContext);
};

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  const signup = async (username, email, password) => {
    const response = await apiSignup(username, email, password);
    setUser(response.data.user);
    navigate('/');
  };

  const login = async (username, password) => {
    const response = await apiLogin(username, password);
    setUser(response.data.user);
    navigate('/');
  };

  const logout = () => {
    setUser(null);
    navigate('/');
  };

  const resetPassword = async (email) => {
    await sendPasswordResetEmail(email);
  };

  return (
    <AuthContext.Provider value={{ user, signup, login, logout, resetPassword }}>
      {children}
    </AuthContext.Provider>
  );
};
