import React, { useState, useEffect } from "react";

const DropdownWithSearch = ({ placeholder, fetchOptions, value, onChange }) => {
  const [options, setOptions] = useState([]);      // Dropdown options
  const [searchTerm, setSearchTerm] = useState("");  // Current search term
  const [loading, setLoading] = useState(false);     // Loading indicator
  const [focused, setFocused] = useState(false);     // Tracks if the input is focused

  useEffect(() => {
    // Function to fetch options based on the current search term
    const loadOptions = async () => {
      if (!searchTerm.trim()) {
        setOptions([]); // Clear options if search term is empty
        return;
      }
      setLoading(true);
      try {
        const fetchedOptions = await fetchOptions(searchTerm);
        setOptions(fetchedOptions);
      } catch (error) {
        console.error("Error fetching options:", error);
        setOptions([]);
      }
      setLoading(false);
    };

    // Debounce input to avoid excessive API calls
    const debounceTimeout = setTimeout(() => {
      loadOptions();
    }, 300); // 300ms debounce

    return () => clearTimeout(debounceTimeout); // Cleanup timeout
  }, [searchTerm, fetchOptions]);

  // When an option is selected from the dropdown:
  const handleSelect = (option) => {
    onChange({ value: option, type: "predefined" });  // Notify parent of a predefined selection
    setSearchTerm(option);  // Update the input with the selected option
    setOptions([]);         // Clear the options
    setFocused(false);      // Close the dropdown
  };

  // When the user types or changes the input:
  const handleInputChange = (e) => {
    const inputValue = e.target.value;
    setSearchTerm(inputValue);

    if (inputValue.trim() === "") {
      onChange({ value: "", type: "none" });
    } else {
      onChange({ value: inputValue, type: "custom" });
    }
  };

  return (
    <div className="relative w-full">
      <input
        type="text"
        placeholder={placeholder}
        value={searchTerm}
        onFocus={() => setFocused(true)}
        onBlur={() => setFocused(false)}
        onChange={handleInputChange}
        className="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
      {focused && searchTerm && (
        <div className="absolute z-10 bg-white border w-full rounded-lg shadow-md max-h-60 overflow-y-auto">
          {loading ? (
            <div className="p-2 text-center text-gray-500">Loading...</div>
          ) : options.length === 0 ? (
            <div className="p-2 text-center text-gray-500">No predefined found</div>
          ) : (
            options.map((option, index) => (
              <div
                key={index}
                onMouseDown={() => handleSelect(option)}
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
