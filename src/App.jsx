import { Routes, Route, Navigate } from 'react-router-dom'
import Layout from './components/Layout'
import DIQuest from './pages/DIQuest'
import BranchSelect from './pages/BranchSelect'
import QuestMap from './pages/QuestMap'
import QuestDetail from './pages/QuestDetail'
import CaseStudy from './pages/CaseStudy'
import ProgressDashboard from './pages/ProgressDashboard'
import NPCChat from './pages/NPCChat'
import LessonView from './pages/LessonView'
import ReviewQueue from './pages/ReviewQueue'

function App() {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
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
        </Route>
        <Route index element={<Navigate to="/di-quest" replace />} />
      </Route>
    </Routes>
  )
}

export default App
