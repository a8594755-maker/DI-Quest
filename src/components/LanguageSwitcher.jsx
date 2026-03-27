import { useTranslation } from 'react-i18next'

function LanguageSwitcher() {
  const { i18n } = useTranslation()
  const isZh = i18n.language === 'zh-TW'

  const toggle = () => {
    i18n.changeLanguage(isZh ? 'en' : 'zh-TW')
  }

  return (
    <button
      onClick={toggle}
      className="px-3 py-1 rounded text-xs bg-slate-800 text-slate-400 border border-slate-700 hover:text-slate-300 transition-colors"
      title={isZh ? 'Switch to English' : '切換為中文'}
    >
      {isZh ? '中' : 'EN'}
      <span className="text-slate-600 mx-1">/</span>
      {isZh ? 'EN' : '中'}
    </button>
  )
}

export default LanguageSwitcher
