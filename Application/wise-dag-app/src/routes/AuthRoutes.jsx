// src/routes/AuthRoutes.jsx
import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Login from '../components/Auth/Login';
import Signup from '../components/Auth/Signup';
import Dashboard from '../pages/Dashboard';

const AuthRoutes = () => (
  <Routes>
    <Route path="/login" element={<Login />} />
    <Route path="/signup" element={<Signup />} />
    <Route path="/dashboard" element={<Dashboard />} />
  </Routes>
);

export default AuthRoutes;
