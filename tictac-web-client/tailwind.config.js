/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],  theme: {
    extend: {
      colors: {
        'red-accent': '#E76963',
        'secondary-accent': '#8266A0',
        'yellow-accent': '#F8BF2A',
        'icon-color': '#A9A4B6',
        'main-white': '#F9F7FF',
        'primary-purple': '#443B5E',
        'secondary-purple': '#8266A0',
        'alternative-white': '#EFEDF5'

      }
    },
  },
  plugins: [],
}

