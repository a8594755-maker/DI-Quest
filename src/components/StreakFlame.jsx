import { motion } from 'framer-motion'
import { Flame } from 'lucide-react'

function StreakFlame({ streakDays, size = 'sm', showLabel = false }) {
  const isActive = streakDays > 0

  const sizeClasses = {
    sm: 'w-4 h-4',
    md: 'w-6 h-6',
    lg: 'w-10 h-10',
    xl: 'w-16 h-16',
  }

  const textClasses = {
    sm: 'text-sm',
    md: 'text-base',
    lg: 'text-xl',
    xl: 'text-3xl',
  }

  return (
    <div className="flex items-center gap-1.5">
      <motion.div
        animate={isActive ? {
          scale: [1, 1.15, 1],
          rotate: [0, -5, 5, 0],
        } : {}}
        transition={{
          duration: 2,
          repeat: Infinity,
          repeatDelay: 1,
        }}
        className="relative"
      >
        <Flame
          className={`${sizeClasses[size]} ${
            isActive ? 'text-orange-400' : 'text-slate-600'
          }`}
          fill={isActive ? 'currentColor' : 'none'}
        />
        {isActive && (
          <motion.div
            className="absolute inset-0"
            animate={{ opacity: [0.3, 0.7, 0.3] }}
            transition={{ duration: 1.5, repeat: Infinity }}
          >
            <Flame
              className={`${sizeClasses[size]} text-orange-300 blur-[2px]`}
              fill="currentColor"
            />
          </motion.div>
        )}
      </motion.div>
      <span className={`font-bold ${textClasses[size]} ${
        isActive ? 'text-orange-400' : 'text-slate-600'
      }`}>
        {streakDays}
      </span>
      {showLabel && (
        <span className={`text-sm ${isActive ? 'text-orange-300' : 'text-slate-600'}`}>
          day{streakDays !== 1 ? 's' : ''}
        </span>
      )}
    </div>
  )
}

export default StreakFlame
