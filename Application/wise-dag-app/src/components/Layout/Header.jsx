import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import logo from '../../assets/logo.png'; // Ensure the logo path is correct

const Header = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout(() => {
      navigate('/'); // Redirect to homepage after logout
    });
  };

  return (
    <header className="bg-green-600 text-white p-4 shadow-md">
      <div className="container mx-auto flex justify-between items-center">
        {/* Logo & App Name */}
        <Link to={user ? '/dashboard' : '/'} className="flex items-center gap-2">
          <img
            src={logo}
            alt="WISE DAG Logo"
            className="h-10 w-auto"
            onError={(e) => {
              console.error('Logo failed to load', e);
              e.target.src = 'https://via.placeholder.com/150'; // Fallback placeholder
            }}
          />
          <h1 className="text-xl font-bold">WISE DAG</h1>
        </Link>

        {/* User Info & Logout */}
        {user && (
          <nav>
            <div className="flex items-center gap-4">
              <span>Welcome, {user.email}</span>
              <button
                onClick={handleLogout}
                className="text-white underline hover:text-gray-200"
              >
                Logout
              </button>
            </div>
          </nav>
        )}
      </div>
    </header>
  );
};

export default Header;
