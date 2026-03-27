import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
  },
  build: {
    outDir: 'dist',
    rollupOptions: {
      output: {
        manualChunks: {
          'worlds-ba': [
            './src/data/worlds/businessAnalysis.js',
            './src/data/worlds/businessAnalysis_en.js',
            './src/data/worlds/businessAnalysisAdvanced.js',
            './src/data/worlds/businessAnalysisAdvanced_en.js',
            './src/data/worlds/businessAnalysisExtra.js',
            './src/data/worlds/businessAnalysisExtra_en.js',
          ],
          'worlds-sql': [
            './src/data/worlds/sql.js',
            './src/data/worlds/sql_en.js',
            './src/data/worlds/_w23_generated.js',
            './src/data/worlds/_w24_generated.js',
            './src/data/worlds/_w25_generated.js',
            './src/data/worlds/_w26_generated.js',
            './src/data/worlds/_w23_generated_en.js',
            './src/data/worlds/_w24_generated_en.js',
            './src/data/worlds/_w25_generated_en.js',
            './src/data/worlds/_w26_generated_en.js',
            './src/data/worlds/_w23_extra.js',
            './src/data/worlds/_w24_extra.js',
            './src/data/worlds/_w25_extra.js',
            './src/data/worlds/_w26_extra.js',
            './src/data/worlds/_w23_extra_en.js',
            './src/data/worlds/_w24_extra_en.js',
            './src/data/worlds/_w25_extra_en.js',
            './src/data/worlds/_w26_extra_en.js',
          ],
          'worlds-python': [
            './src/data/worlds/python.js',
            './src/data/worlds/python_en.js',
          ],
          'worlds-di': [
            './src/data/worlds/diProduct.js',
            './src/data/worlds/diProduct_en.js',
          ],
          'worlds-english': [
            './src/data/worlds/professionalEnglish.js',
            './src/data/worlds/professionalEnglishExtra.js',
          ],
          'lessons': [
            './src/data/lessons/index.js',
          ],
          'vendor': [
            'react',
            'react-dom',
            'react-router-dom',
            'framer-motion',
          ],
        },
      },
    },
  },
  optimizeDeps: {
    exclude: ['sql.js'],
  },
})
