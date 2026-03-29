/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'brand-primary': '#3B82F6',
        'brand-secondary': '#10B981',
        'brand-accent': '#F59E0B',
        'brand-dark': '#1E293B',
        'brand-light': '#F8FAFC',
      }
    },
  },
  plugins: [require('@tailwindcss/typography')],
}
