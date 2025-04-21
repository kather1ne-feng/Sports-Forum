/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      "./app/views/**/*.{html,erb}",
      "./app/helpers/**/*.rb",
      "./app/javascript/**/*.js"
    ],
    theme: {
      extend: {
        colors: {
          primary: '#bfceff',
          primaryDark: '#a7b7ff',
          primaryText: '#1a1a1a',
        },
      },
    },
    plugins: [require("@tailwindcss/forms"), require("@tailwindcss/typography")],
  }
  