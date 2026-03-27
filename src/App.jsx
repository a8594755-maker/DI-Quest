import { Routes, Route, Navigate } from 'react-router-dom'
import Layout from './components/Layout'
import ProtectedRoute from './components/ProtectedRoute'
import DIQuest from './pages/DIQuest'
import BranchSelect from './pages/BranchSelect'
import QuestMap from './pages/QuestMap'
import QuestDetail from './pages/QuestDetail'
import CaseStudy from './pages/CaseStudy'
import ProgressDashboard from './pages/ProgressDashboard'
import NPCChat from './pages/NPCChat'
import LessonView from './pages/LessonView'
import ReviewQueue from './pages/ReviewQueue'
import LoginPage from './pages/LoginPage'
import FriendsPage from './pages/FriendsPage'

function App() {
  return (
    <Routes>
      <Route path="di-quest/login" element={<LoginPage />} />
      <Route path="/" element={<ProtectedRoute><Layout /></ProtectedRoute>}>
        <Route path="di-quest" element={<DIQuest />}>
          <Route index element={<BranchSelect />} />
          <Route path="map" element={<BranchSelect />} />
          <Route path="branch/:branchId" element={<QuestMap />} />
          <Route path="quest/:worldId/:questId" element={<QuestDetail />} />
          <Route path="case/:worldId/:questId/:challengeId?" element={<CaseStudy />} />
          <Route path="lesson/:worldId" element={<LessonView />} />
          <Route path="progress" element={<ProgressDashboard />} />
          <Route path="chat" element={<NPCChat />} />
          <Route path="review" element={<ReviewQueue />} />
          <Route path="friends" element={<FriendsPage />} />
        </Route>
        <Route index element={<Navigate to="/di-quest" replace />} />
      </Route>
    </Routes>
  )
}

export default App
