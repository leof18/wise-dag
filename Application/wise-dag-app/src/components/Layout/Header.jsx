import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../../assets/logo.png';

const Header = () => {
  return (
    <header className="bg-white shadow-md">
      <div className="container mx-auto px-6 py-4 flex justify-between items-center">
        <Link to="/" className="flex items-center gap-2">
          <img src={logo} alt="WISE DAG Logo" className="h-10" />
          <h1 className="text-2xl font-bold text-green-600">WISE DAG</h1>
        </Link>
        <nav className="space-x-4">
          <Link to="/" className="hover:text-green-600">Home</Link>
          <Link to="/login" className="hover:text-green-600">Login</Link>
          <Link to="/dashboard" className="hover:text-green-600">Dashboard</Link>
        </nav>
      </div>
    </header>
  );
};

export default Header;
