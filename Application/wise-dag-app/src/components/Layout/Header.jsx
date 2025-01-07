import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import logo from '../../assets/logo.png';

const Header = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleHomeClick = () => {
    if (user) {
      navigate('/dashboard'); // Redirect to dashboard if logged in
    } else {
      navigate('/'); // Redirect to home page if not logged in
    }
  };

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <header className="bg-green-600 text-white shadow-lg">
      <div className="container mx-auto flex justify-between items-center py-4 px-6">
        {/* Logo and Title (Home Link) */}
        <div
          className="flex items-center gap-4 cursor-pointer"
          onClick={handleHomeClick}
        >
          <img
            src={logo}
            alt="WISE DAG Logo"
            className="h-12 w-auto transition-transform duration-500 ease-in-out hover:scale-105"
          />
          <h1 className="text-3xl font-bold">WISE DAG</h1>
        </div>

        {/* Navigation Links */}
        <nav className="flex gap-6 items-center">
          {user ? (
            <>
              <span className="text-lg">Welcome, {user.email}</span>
              <button
                onClick={handleLogout}
                className="px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600"
              >
                Logout
              </button>
            </>
          ) : (
            <>
              <Link to="/login" className="hover:underline">
                Login
              </Link>
              <Link to="/signup" className="hover:underline">
                Signup
              </Link>
            </>
          )}
        </nav>
      </div>
    </header>
  );
};

export default Header;
