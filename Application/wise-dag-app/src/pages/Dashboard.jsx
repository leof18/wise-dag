import React from 'react';

const Dashboard = () => {
  return (
    <div className="p-6 bg-gray-50 min-h-screen">
      <h1 className="text-3xl font-bold mb-4">Welcome to the Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="p-4 bg-white rounded-lg shadow-md">Widget 1</div>
        <div className="p-4 bg-white rounded-lg shadow-md">Widget 2</div>
        <div className="p-4 bg-white rounded-lg shadow-md">Widget 3</div>
      </div>
    </div>
  );
};

export default Dashboard;
