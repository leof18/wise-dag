import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Login from './components/Auth/Login';
import Signup from './components/Auth/Signup';
import ForgotPassword from './components/Auth/ForgotPassword';
import ResearchPage from './components/ResearchPage/ResearchPage';
import GraphPage from './components/GraphPage/GraphPage';
import TimepointPage from './components/TimepointPage';
import DagittyPage from './components/DagittyPage';

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
        <Route path="/dagitty" element={<DagittyPage />} />
        <Route path="/timepoints" element={<TimepointPage />} />
      </Routes>
    </Layout>
  );
};

export default App;
