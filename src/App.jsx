import { lazy, Suspense } from 'react'
import { Routes, Route, Navigate } from 'react-router-dom'
import Layout from './components/Layout'
import ProtectedRoute from './components/ProtectedRoute'

// Lazy-loaded pages
const DIQuest = lazy(() => import('./pages/DIQuest'))
const BranchSelect = lazy(() => import('./pages/BranchSelect'))
const QuestMap = lazy(() => import('./pages/QuestMap'))
const QuestDetail = lazy(() => import('./pages/QuestDetail'))
const CaseStudy = lazy(() => import('./pages/CaseStudy'))
const ProgressDashboard = lazy(() => import('./pages/ProgressDashboard'))
const NPCChat = lazy(() => import('./pages/NPCChat'))
const LessonView = lazy(() => import('./pages/LessonView'))
const ReviewQueue = lazy(() => import('./pages/ReviewQueue'))
const LoginPage = lazy(() => import('./pages/LoginPage'))
const FriendsPage = lazy(() => import('./pages/FriendsPage'))

function Loading() {
  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-900">
      <div className="animate-spin rounded-full h-8 w-8 border-t-2 border-b-2 border-blue-400" />
    </div>
  )
}

function App() {
  return (
    <Suspense fallback={<Loading />}>
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
    </Suspense>
  )
}

export default App
