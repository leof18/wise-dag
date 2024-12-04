import React from "react";
import { Link } from "react-router-dom";
import logo from "../../assets/logo.png";

const HomePage = () => {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col">
      {/* Header Section */}
      <header className="bg-green-600 text-white shadow-lg">
        <div className="container mx-auto flex justify-between items-center py-4 px-6">
          <div className="flex items-center gap-4">
            <img
              src={logo}
              alt="WISE DAG Logo"
              className="h-12 w-auto transition-transform duration-500 ease-in-out hover:scale-105"
            />
            <h1 className="text-3xl font-bold">WISE DAG</h1>
          </div>
          <nav className="flex gap-6">
            <a href="#features" className="hover:underline">
              Features
            </a>
            <a href="#about" className="hover:underline">
              About
            </a>
            <a href="#contact" className="hover:underline">
              Contact
            </a>
          </nav>
        </div>
      </header>

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
          <h2 className="text-4xl font-bold text-lg text-gray-800">
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
              to="/dashboard"
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

      {/* Features Section */}
      <section id="features" className="bg-gray-100 py-16">
        <div className="container mx-auto px-6">
          <h3 className="text-3xl font-bold text-center text-gray-800 mb-12">
            Core Features
          </h3>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <div className="bg-white p-6 shadow-lg rounded-lg">
              <h4 className="text-xl font-semibold text-gray-800">
                Intuitive Graph Builder
              </h4>
              <p className="text-gray-600 mt-2">
                Create and customize DAGs with a user-friendly interface.
              </p>
            </div>
            <div className="bg-white p-6 shadow-lg rounded-lg">
              <h4 className="text-xl font-semibold text-gray-800">
                Granularity Control
              </h4>
              <p className="text-gray-600 mt-2">
                Adjust the level of detail to focus on specific relationships.
              </p>
            </div>
            <div className="bg-white p-6 shadow-lg rounded-lg">
              <h4 className="text-xl font-semibold text-gray-800">
                Timepoint Management
              </h4>
              <p className="text-gray-600 mt-2">
                Visualize changes over multiple timepoints for dynamic insights.
              </p>
            </div>
            <div className="bg-white p-6 shadow-lg rounded-lg">
              <h4 className="text-xl font-semibold text-gray-800">
                Conflict Resolution
              </h4>
              <p className="text-gray-600 mt-2">
                Detect and resolve conflicts in your graph with smart tools.
              </p>
            </div>
            <div className="bg-white p-6 shadow-lg rounded-lg">
              <h4 className="text-xl font-semibold text-gray-800">
                Consensus DAG Generation
              </h4>
              <p className="text-gray-600 mt-2">
                Aggregate expert opinions into a unified, actionable DAG.
              </p>
            </div>
            <div className="bg-white p-6 shadow-lg rounded-lg">
              <h4 className="text-xl font-semibold text-gray-800">
                Export Options
              </h4>
              <p className="text-gray-600 mt-2">
                Export DAGs as code, images, or JSON for further analysis.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* About Section */}
      <section id="about" className="bg-white py-16 text-center">
        <div className="container mx-auto px-6">
          <h3 className="text-3xl font-bold text-gray-800 mb-8">
            About WISE DAG
          </h3>
          <p className="text-lg text-gray-600 max-w-3xl mx-auto mb-6">
            WISE-DAG (Wisdom of Stroke Experts translated into Directed Acyclic Graphs) is a study
            to aggregate the expert causal knowledge of clinicians and researchers about
            stroke-related processes. By applying the principle of "The Wisdom of Crowds," 
            we aim to summarize decentralized opinions into a consensus DAG.
          </p>
          <p className="text-lg text-gray-600 max-w-3xl mx-auto">
            Participants are experts in stroke research who learn to build and analyze DAGs
            through lectures, Q&A sessions, and hands-on practice. Our goal is to generate a
            unified DAG that informs meaningful clinical research.
          </p>
        </div>
      </section>

      {/* Footer Section */}
      <footer className="bg-gray-800 text-white py-6">
        <div className="container mx-auto text-center">
          <p>&copy; 2024 WISE DAG. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
};

export default HomePage;
