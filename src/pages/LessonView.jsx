import { useParams, Link, useLocation } from 'react-router-dom'
import { ArrowLeft, BookOpen, ChevronUp } from 'lucide-react'
import { useState, useEffect, useRef, useMemo } from 'react'
import { useTranslation } from 'react-i18next'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import { getWorldLesson } from '../data/lessons'
import { WORLDS } from '../data/questData'
import { getBranchForWorld } from '../data/branches'

function LessonView() {
  const { t } = useTranslation('common')
  const { worldId } = useParams()
  const branch = getBranchForWorld(worldId)
  const backPath = branch ? `/di-quest/branch/${branch.id}` : '/di-quest'
  const location = useLocation()
  const lesson = getWorldLesson(Number(worldId))
  const world = WORLDS.find(w => w.id === Number(worldId))
  const [showToc, setShowToc] = useState(() => window.innerWidth >= 768)
  const [activeHeading, setActiveHeading] = useState('')
  const contentRef = useRef(null)
  const [showScrollTop, setShowScrollTop] = useState(false)

  const toc = useMemo(() => {
    if (!lesson) return []
    const headings = []
    const lines = lesson.split('\n')
    for (const line of lines) {
      const m2 = line.match(/^## (.+)/)
      const m3 = line.match(/^### (.+)/)
      if (m2) headings.push({ level: 2, text: m2[1], id: slugify(m2[1]) })
      else if (m3) headings.push({ level: 3, text: m3[1], id: slugify(m3[1]) })
    }
    return headings
  }, [lesson])

  useEffect(() => {
    if (!location.hash) return
    const id = decodeURIComponent(location.hash.slice(1))
    const timer = setTimeout(() => {
      const el = contentRef.current?.querySelector(`#${CSS.escape(id)}`)
      if (el) {
        el.scrollIntoView({ behavior: 'smooth', block: 'start' })
        setActiveHeading(id)
      }
    }, 300)
    return () => clearTimeout(timer)
  }, [location.hash])

  useEffect(() => {
    const container = contentRef.current
    if (!container) return

    const handleScroll = () => {
      setShowScrollTop(container.scrollTop > 400)

      const headingElements = container.querySelectorAll('h2, h3')
      let current = ''
      for (const el of headingElements) {
        const rect = el.getBoundingClientRect()
        const containerRect = container.getBoundingClientRect()
        if (rect.top - containerRect.top < 120) {
          current = el.id
        }
      }
      if (current) setActiveHeading(current)
    }

    container.addEventListener('scroll', handleScroll)
    return () => container.removeEventListener('scroll', handleScroll)
  }, [])

  const scrollToHeading = (id) => {
    const el = contentRef.current?.querySelector(`#${CSS.escape(id)}`)
    if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' })
  }

  const scrollToTop = () => {
    contentRef.current?.scrollTo({ top: 0, behavior: 'smooth' })
  }

  if (!lesson || !world) {
    return (
      <div className="max-w-4xl mx-auto p-6 text-center py-20">
        <p className="text-slate-500 text-lg">{t('lesson.notFound')}</p>
        <Link to={backPath} className="btn-primary inline-block mt-4">{t('action.backToMap')}</Link>
      </div>
    )
  }

  return (
    <div className="h-[calc(100vh-73px)] flex relative">
      {/* 側邊目錄 */}
      <aside className={`${showToc ? 'w-72' : 'w-0'} flex-shrink-0 border-r border-slate-700 bg-slate-900/50 overflow-hidden transition-all duration-300 ${showToc ? 'absolute md:relative z-30 h-full shadow-2xl md:shadow-none' : ''}`}>
        <div className="w-72 h-full overflow-y-auto p-4">
          <div className="flex items-center gap-2 mb-4 pb-3 border-b border-slate-700">
            <BookOpen className="w-4 h-4 text-brand-primary" />
            <span className="text-white font-medium text-sm">{t('lesson.toc')}</span>
          </div>
          <nav className="space-y-1">
            {toc.map((item) => (
              <button
                key={item.id}
                onClick={() => scrollToHeading(item.id)}
                className={`block w-full text-left text-sm py-1.5 px-2 rounded transition-colors ${
                  item.level === 3 ? 'pl-6' : ''
                } ${
                  activeHeading === item.id
                    ? 'text-brand-primary bg-brand-primary/10'
                    : 'text-slate-400 hover:text-white hover:bg-slate-800'
                }`}
              >
                {item.text}
              </button>
            ))}
          </nav>
        </div>
      </aside>

      {/* 主要內容 */}
      <div className="flex-1 flex flex-col min-w-0">
        <div className="flex items-center justify-between px-3 sm:px-6 py-2 sm:py-3 border-b border-slate-700 bg-slate-900/50 flex-shrink-0">
          <div className="flex items-center gap-2 sm:gap-4 min-w-0">
            <Link to={backPath} className="text-slate-400 hover:text-white transition-colors flex-shrink-0">
              <ArrowLeft className="w-5 h-5" />
            </Link>
            <div className="min-w-0 truncate">
              <span className="text-xl sm:text-2xl mr-1 sm:mr-2">{world.emoji}</span>
              <span className="text-white font-medium text-sm sm:text-base">{world.name} — {t('lesson.lessonSuffix')}</span>
            </div>
          </div>
          <div className="flex items-center gap-2 sm:gap-3 flex-shrink-0">
            <button
              onClick={() => setShowToc(!showToc)}
              className="px-2 sm:px-3 py-1.5 text-slate-400 hover:text-white text-xs sm:text-sm border border-slate-700 rounded transition-colors"
            >
              {showToc ? t('lesson.hideToc') : t('lesson.showToc')}
            </button>
            <Link
              to={backPath}
              className="px-3 sm:px-4 py-1.5 bg-brand-primary text-white text-xs sm:text-sm rounded hover:bg-blue-600 transition-colors"
            >
              {t('action.startChallenge')}
            </Link>
          </div>
        </div>

        <div ref={contentRef} className="flex-1 overflow-y-auto">
          <article className="max-w-3xl mx-auto px-4 sm:px-8 py-4 sm:py-8 lesson-content">
            <ReactMarkdown
              remarkPlugins={[remarkGfm]}
              components={{
                h1: ({ children }) => {
                  const id = slugify(String(children))
                  return <h1 id={id} className="text-3xl font-bold text-white mb-6 mt-2">{children}</h1>
                },
                h2: ({ children }) => {
                  const id = slugify(String(children))
                  return <h2 id={id} className="text-2xl font-bold text-white mb-4 mt-10 pb-2 border-b border-slate-700 scroll-mt-4">{children}</h2>
                },
                h3: ({ children }) => {
                  const id = slugify(String(children))
                  return <h3 id={id} className="text-xl font-semibold text-white mb-3 mt-8 scroll-mt-4">{children}</h3>
                },
                p: ({ children }) => <p className="text-slate-300 leading-relaxed mb-4">{children}</p>,
                strong: ({ children }) => <strong className="text-white font-semibold">{children}</strong>,
                em: ({ children }) => <em className="text-slate-400 italic">{children}</em>,
                blockquote: ({ children }) => (
                  <blockquote className="border-l-4 border-brand-primary pl-4 my-4 bg-brand-primary/5 py-3 pr-4 rounded-r-lg">
                    {children}
                  </blockquote>
                ),
                ul: ({ children }) => <ul className="list-disc list-inside text-slate-300 mb-4 space-y-1">{children}</ul>,
                ol: ({ children }) => <ol className="list-decimal list-inside text-slate-300 mb-4 space-y-1">{children}</ol>,
                li: ({ children }) => <li className="text-slate-300">{children}</li>,
                hr: () => <hr className="border-slate-700 my-8" />,
                a: ({ href, children }) => (
                  <a href={href} className="text-brand-primary hover:underline" target="_blank" rel="noopener noreferrer">{children}</a>
                ),
                code: ({ inline, className, children }) => {
                  if (inline) {
                    return <code className="bg-slate-800 text-brand-accent px-1.5 py-0.5 rounded text-sm font-mono">{children}</code>
                  }
                  const lang = className?.replace('language-', '') || ''
                  return (
                    <div className="relative my-4">
                      {lang && (
                        <div className="absolute top-0 right-0 px-2 py-1 text-xs text-slate-500 bg-slate-800 rounded-bl rounded-tr-lg">
                          {lang}
                        </div>
                      )}
                      <pre className="bg-slate-900 border border-slate-700 rounded-lg p-4 overflow-x-auto">
                        <code className="text-sm font-mono text-slate-300 leading-relaxed">{children}</code>
                      </pre>
                    </div>
                  )
                },
                table: ({ children }) => (
                  <div className="overflow-x-auto my-4">
                    <table className="min-w-full border border-slate-700 rounded-lg overflow-hidden">{children}</table>
                  </div>
                ),
                thead: ({ children }) => <thead className="bg-slate-800">{children}</thead>,
                th: ({ children }) => <th className="px-4 py-2 text-left text-sm font-medium text-white border-b border-slate-700">{children}</th>,
                td: ({ children }) => <td className="px-4 py-2 text-sm text-slate-300 border-b border-slate-800">{children}</td>,
                tr: ({ children }) => <tr className="hover:bg-slate-800/50">{children}</tr>,
              }}
            >
              {lesson}
            </ReactMarkdown>
          </article>
        </div>

        {showScrollTop && (
          <button
            onClick={scrollToTop}
            className="fixed bottom-24 right-24 w-10 h-10 bg-slate-800 border border-slate-700 rounded-full flex items-center justify-center text-slate-400 hover:text-white hover:bg-slate-700 transition-colors shadow-lg z-50"
          >
            <ChevronUp className="w-5 h-5" />
          </button>
        )}
      </div>
    </div>
  )
}

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\u4e00-\u9fff\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .trim()
}

export default LessonView
