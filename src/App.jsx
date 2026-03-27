import { Routes, Route, Navigate } from 'react-router-dom'
import Layout from './components/Layout'
import DIQuest from './pages/DIQuest'
import QuestMap from './pages/QuestMap'
import QuestDetail from './pages/QuestDetail'
import CodeArena from './pages/CodeArena'
import ProgressDashboard from './pages/ProgressDashboard'
import NPCChat from './pages/NPCChat'
import LessonView from './pages/LessonView'

function App() {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route path="di-quest" element={<DIQuest />}>
          <Route index element={<QuestMap />} />
          <Route path="map" element={<QuestMap />} />
          <Route path="quest/:worldId/:questId" element={<QuestDetail />} />
          <Route path="arena/:worldId/:questId/:challengeId?" element={<CodeArena />} />
          <Route path="lesson/:worldId" element={<LessonView />} />
          <Route path="progress" element={<ProgressDashboard />} />
          <Route path="chat" element={<NPCChat />} />
        </Route>
        <Route index element={<Navigate to="/di-quest" replace />} />
      </Route>
    </Routes>
  )
}

export default App
