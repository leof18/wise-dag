import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../../assets/logo.png';

const HomePage = () => {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col">
      {/* Hero Section */}
      <section
        className="bg-cover bg-center py-16 text-center"
        style={{
          backgroundImage: "url('https://source.unsplash.com/1600x900/?research,science')",
        }}
      >
        <div className="container mx-auto px-6">
          <img
            src={logo}
            alt="WISE DAG Logo"
            className="mx-auto mb-6 h-30 w-auto transition-opacity duration-700 ease-in-out"
          />
          <h2 className="text-4xl font-bold text-gray-800">
            Wisdom of Stroke Experts Translated into Directed Acyclic Graphs
          </h2>
          <p className="text-lg text-gray-800 mt-4 max-w-3xl mx-auto">
            WISE-DAG is a study to aggregate the expert causal knowledge of
            clinicians and researchers about stroke-related processes. 
            Explore our intuitive platform for building, analyzing, and
            understanding causal relationships.
          </p>
          <div className="mt-8 flex justify-center gap-4">
            <Link
              to="/research"
              className="px-8 py-3 bg-green-600 text-white text-lg font-semibold rounded-lg shadow-md hover:bg-green-700"
            >
              Get Started
            </Link>
            <a
              href="#about"
              className="px-8 py-3 bg-gray-200 text-gray-800 text-lg font-semibold rounded-lg shadow-md hover:bg-gray-300"
            >
              Learn More
            </a>
          </div>
        </div>
      </section>
    </div>
  );
};

export default HomePage;
