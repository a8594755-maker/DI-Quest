import './i18n'
import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { AuthProvider } from './contexts/AuthContext'
import { QuestProvider } from './contexts/QuestContext'
import App from './App.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <AuthProvider>
        <QuestProvider>
          <App />
        </QuestProvider>
      </AuthProvider>
    </BrowserRouter>
  </React.StrictMode>,
)
