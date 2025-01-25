import React, { useState, useEffect } from "react";

const DropdownWithSearch = ({ placeholder, fetchOptions, value, onChange }) => {
  const [options, setOptions] = useState([]); // Dropdown options
  const [searchTerm, setSearchTerm] = useState(""); // Current search term
  const [loading, setLoading] = useState(false); // Loading indicator
  const [focused, setFocused] = useState(false); // Tracks if the input is focused

  useEffect(() => {
    const loadOptions = async () => {
      if (!searchTerm) {
        setOptions([]);
        return;
      }
      setLoading(true);
      const fetchedOptions = await fetchOptions(searchTerm);
      setOptions(fetchedOptions);
      setLoading(false);
    };

    const timeoutId = setTimeout(() => {
      loadOptions();
    }, 300); // Debounce for smooth experience

    return () => clearTimeout(timeoutId); // Cleanup
  }, [searchTerm, fetchOptions]);

  const handleSelect = (option) => {
    onChange(option);
    setSearchTerm("");
    setOptions([]);
    setFocused(false);
  };

  return (
    <div className="relative w-full">
      <input
        type="text"
        placeholder={placeholder}
        value={searchTerm || value || ""}
        onFocus={() => setFocused(true)}
        onChange={(e) => setSearchTerm(e.target.value)}
        className="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
      {focused && (
        <div className="absolute z-10 bg-white border w-full rounded-lg shadow-md max-h-60 overflow-y-auto">
          {loading ? (
            <div className="p-2 text-center text-gray-500">Loading...</div>
          ) : options.length === 0 ? (
            <div className="p-2 text-center text-gray-500">No options found</div>
          ) : (
            options.map((option, index) => (
              <div
                key={index}
                onClick={() => handleSelect(option)}
                className="cursor-pointer px-4 py-2 hover:bg-gray-100"
              >
                {option}
              </div>
            ))
          )}
        </div>
      )}
    </div>
  );
};

export default DropdownWithSearch;
