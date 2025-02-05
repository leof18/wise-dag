import React, { useEffect } from "react";

const DagittyPage = () => {
  useEffect(() => {
    const scripts = ["dagitty.js", "base64.js", "example-dags.js", "main.js"];

    scripts.forEach((scriptName) => {
      const script = document.createElement("script");
      script.src = `/dagitty/${scriptName}`; // Load from public/dagitty/
      script.async = true;
      document.body.appendChild(script);

      script.onerror = () => {
        console.error(`Failed to load script: ${scriptName}`);
      };
    });

    return () => {
      // Cleanup scripts on unmount
      scripts.forEach((scriptName) => {
        const script = document.querySelector(
          `script[src="/dagitty/${scriptName}"]`
        );
        if (script) document.body.removeChild(script);
      });
    };
  }, []);

  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-4 bg-white">
      <h1 className="text-2xl font-bold mb-4">DAGitty Visualization</h1>
      <iframe
        src="/dagitty/dags.html"
        title="DAGitty Graph"
        className="w-full h-[80vh] border"
      ></iframe>
    </div>
  );
};

export default DagittyPage;
