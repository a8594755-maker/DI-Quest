import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'

import commonZh from './locales/zh-TW/common.json'
import questZh from './locales/zh-TW/quest.json'
import caseZh from './locales/zh-TW/case.json'
import progressZh from './locales/zh-TW/progress.json'
import chatZh from './locales/zh-TW/chat.json'
import reviewZh from './locales/zh-TW/review.json'
import authZh from './locales/zh-TW/auth.json'
import socialZh from './locales/zh-TW/social.json'

import commonEn from './locales/en/common.json'
import questEn from './locales/en/quest.json'
import caseEn from './locales/en/case.json'
import progressEn from './locales/en/progress.json'
import chatEn from './locales/en/chat.json'
import reviewEn from './locales/en/review.json'
import authEn from './locales/en/auth.json'
import socialEn from './locales/en/social.json'

const savedLang = localStorage.getItem('di-quest-lang') || 'zh-TW'

i18n.use(initReactI18next).init({
  resources: {
    'zh-TW': {
      common: commonZh,
      quest: questZh,
      case: caseZh,
      progress: progressZh,
      chat: chatZh,
      review: reviewZh,
      auth: authZh,
      social: socialZh,
    },
    en: {
      common: commonEn,
      quest: questEn,
      case: caseEn,
      progress: progressEn,
      chat: chatEn,
      review: reviewEn,
      auth: authEn,
      social: socialEn,
    },
  },
  lng: savedLang,
  fallbackLng: 'zh-TW',
  ns: ['common', 'quest', 'case', 'progress', 'chat', 'review', 'auth', 'social'],
  defaultNS: 'common',
  interpolation: {
    escapeValue: false,
  },
})

i18n.on('languageChanged', (lng) => {
  document.documentElement.lang = lng
  localStorage.setItem('di-quest-lang', lng)
})

// Set initial lang attribute
document.documentElement.lang = savedLang

export default i18n
