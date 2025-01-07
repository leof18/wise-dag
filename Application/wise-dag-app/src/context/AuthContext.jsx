import React, { createContext, useContext, useState } from 'react';

// Create AuthContext
export const AuthContext = createContext();

// AuthProvider Component
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(
    JSON.parse(localStorage.getItem('user')) || null
  );

  const login = async (email, password) => {
    if (email === 'test@example.com' && password === 'password123') {
      setUser({ email });
      localStorage.setItem('user', JSON.stringify({ email }));
    } else {
      throw new Error('Invalid credentials');
    }
  };

  const signup = async (email, password) => {
    // Mock Signup Logic
    setUser({ email });
    localStorage.setItem('user', JSON.stringify({ email }));
  };

  const logout = () => {
    setUser(null);
    localStorage.removeItem('user');
  };

  return (
    <AuthContext.Provider value={{ user, login, signup, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

// Custom Hook for Auth
export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
