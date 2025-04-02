import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../../assets/logo.png';

const HomePage = () => {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col">
      {/* Hero Section */}
      <section
        className="bg-cover bg-center py-16 text-center relative"
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
            WISE-DAG is a study to  aggregate knowledge of causal relationships from clinicians and researchers for stroke research. 
            Explore our intuitive platform for building, analyzing, and
            understanding causal relationships.
          </p>
          <div className="mt-8 flex justify-center gap-4 relative z-10">
            <Link
              to="/research"
              className="px-8 py-3 bg-green-600 text-white text-lg font-semibold rounded-lg shadow-md hover:bg-green-700 cursor-pointer"
            >
              Get Started
            </Link>
            <Link
              to="/about"
              className="px-8 py-3 bg-gray-200 text-gray-800 text-lg font-semibold rounded-lg shadow-md hover:bg-gray-300 cursor-pointer relative z-10"
            >
              Learn More
            </Link>
          </div>
        </div>
      </section>
      <footer className="bg-gray-200 text-center py-4 text-sm text-gray-600">
        {/* Policy Buttons */}
        <div className="mt-2 flex justify-center gap-4">
          <a
            href="/privacy.pdf"
            target="_blank"
            rel="noopener noreferrer"
            className="px-4 py-1 text-sm bg-gray-300 text-gray-800 rounded hover:bg-gray-400 transition"
          >
            Privacy Policy
          </a>
          <a
            href="/terms.pdf"
            target="_blank"
            rel="noopener noreferrer"
            className="px-4 py-1 text-sm bg-gray-300 text-gray-800 rounded hover:bg-gray-400 transition"
          >
            Terms & Conditions
          </a>
        </div>
        <div className="mt-2">This research was partially supported by private donations to the Center for Stroke Research Berlin.</div>
        <div className="mt-2 flex justify-center gap-4">
          This application uses{" "}
          <a
            href="https://www.dagitty.net/"
            target="_blank"
            rel="noopener noreferrer"
            className="text-blue-600 underline hover:text-blue-800"
          >
            DAGitty
          </a>
          , developed by Johannes Textor.
        </div>
      </footer>
    </div>

  );
};

export default HomePage;

