/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {},
    fontFamily: {
      'roboto': ['Roboto Slab', 'Roboto', 'system-ui'],
      'archivo': ['Archivo', 'system-ui'],
      'oxanium': ['Oxanium', 'sans-serif']
    },
  },
  plugins: [require("@headlessui/tailwindcss")],
}