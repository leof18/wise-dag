import React, { useEffect } from "react";

/* This page loads the dagitty source code in an iframe */

const DagittyPage = () => {
  useEffect(() => {
    const scripts = ["dagitty.js", "base64.js", "example-dags.js", "main.js"];

    const loadScript = (src) =>
      new Promise((resolve, reject) => {
        const script = document.createElement("script");
        script.src = src;
        script.async = false; // Load in order
        script.onload = () => {
          console.log(`Loaded: ${src}`);
          resolve();
        };
        script.onerror = () => {
          console.error(`Failed to load script: ${src}`);
          reject();
        };
        document.body.appendChild(script);
      });

    Promise.all(scripts.map((scriptName) => loadScript(`/dagitty/${scriptName}`)))
      .then(() => {
        console.log("✅ All scripts loaded!");
        
        // Inject DAGitty input into the textarea inside the iframe
        setTimeout(() => {
          const iframe = document.querySelector("iframe");
          if (iframe) {
            console.log("🔄 Injecting DAGitty input...");
            const dagittyText = localStorage.getItem("dagittyText");
            iframe.contentWindow.postMessage({ dagittyText }, "*"); // Send data to iframe
          }
        }, 500);
      })
      .catch((err) => console.error("Script loading error:", err));

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
