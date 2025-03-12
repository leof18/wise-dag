import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import HomePage from './pages/HomePage';
import Login from './components/Auth/Login';
import Signup from './components/Auth/Signup';
import ForgotPassword from './components/Auth/ForgotPassword';
import ResearchPage from './pages/ResearchPage';
import GraphPage from './pages/GraphPage';
import TimepointPage from './pages/TimepointPage';
import DagittyPage from './pages/DagittyPage';
import AboutUs from './pages/AboutUsPage';

const App = () => {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/forgot-password" element={<ForgotPassword />} />
        <Route path="/research" element={<ResearchPage />} />
        <Route path="/graph" element={<GraphPage />} />
        <Route path="/dagitty" element={<DagittyPage />} />
        <Route path="/timepoints" element={<TimepointPage />} />
        <Route path="/about" element={<AboutUs />} />
      
      </Routes>
    </Layout>
  );
};

export default App;
