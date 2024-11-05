import React, { useState, useEffect } from "react";
import Navbar from "./components/Navbar";
import Home from "./pages/Home";

function App() {
  const [logoColor, setLogoColor] = useState("black"); // Initial color for the logo

  useEffect(() => {
    (function (
      h: any,
      o: Document,
      t: string,
      j: any,
      a?: HTMLHeadElement | null,
      r?: HTMLScriptElement | null
    ) {
      h.hj =
        h.hj ||
        function () {
          (h.hj.q = h.hj.q || []).push(arguments);
        };
      h._hjSettings = { hjid: 5195647, hjsv: 6 };
      a = o.getElementsByTagName("head")[0];
      if (a) {
        r = o.createElement("script");
        r.async = true;
        r.src = `https://static.hotjar.com/c/hotjar-${h._hjSettings.hjid}.js?sv=${h._hjSettings.hjsv}`;
        a.appendChild(r);
      }
    })(window as any, document, "script", null);
  }, []);

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar color={logoColor} /> {/* Pass logoColor to Navbar */}
      <main className="flex-grow">
        <Home setLogoColor={setLogoColor} /> {/* Pass setLogoColor to Home */}
      </main>
    </div>
  );
}

export default App;
