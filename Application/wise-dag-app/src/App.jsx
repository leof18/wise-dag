import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Login from './components/Auth/Login';
import Signup from './components/Auth/Signup';
import ForgotPassword from './components/Auth/ForgotPassword';
import ResearchPage from './components/ResearchPage/ResearchPage';
import GraphPage from './components/GraphPage/GraphPage';

const App = () => {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/forgot-password" element={<ForgotPassword />} />
        <Route path="/research" element={<ResearchPage />} />
        <Route path="/graph" element={<GraphPage />} />
      </Routes>
    </Layout>
  );
};

export default App;
