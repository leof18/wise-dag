import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/logo.png';

const Home = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <section
        className="bg-cover bg-center py-16 text-center"
        style={{ backgroundImage: "url('https://source.unsplash.com/1600x900/?research,science')" }}
      >
        <div className="container mx-auto px-6">
          <img src={logo} alt="WISE DAG Logo" className="mx-auto mb-6 h-24" />
          <h2 className="text-4xl font-bold">Wisdom of Stroke Experts Translated into Directed Acyclic Graphs</h2>
          <p className="text-lg mt-4 max-w-3xl mx-auto">
            Explore our intuitive platform for building, analyzing, and understanding causal relationships.
          </p>
          <div className="mt-8 flex justify-center gap-4">
            <Link to="/login" className="px-8 py-3 bg-green-600 text-white rounded-lg shadow-md">Get Started</Link>
            <Link to="/dashboard" className="px-8 py-3 bg-gray-200 text-gray-800 rounded-lg shadow-md">Learn More</Link>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Home;
