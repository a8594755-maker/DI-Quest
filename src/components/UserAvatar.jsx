function UserAvatar({ username, displayName, avatarUrl, size = 'md' }) {
  const sizeClasses = {
    sm: 'w-8 h-8 text-xs',
    md: 'w-10 h-10 text-sm',
    lg: 'w-14 h-14 text-lg',
  }

  const name = displayName || username || '?'
  const initials = name.slice(0, 2).toUpperCase()

  // Generate a consistent color from username
  const colors = [
    'from-blue-500 to-cyan-500',
    'from-purple-500 to-pink-500',
    'from-emerald-500 to-teal-500',
    'from-orange-500 to-amber-500',
    'from-rose-500 to-red-500',
    'from-indigo-500 to-violet-500',
  ]
  const colorIndex = (username || '').split('').reduce((acc, c) => acc + c.charCodeAt(0), 0) % colors.length

  if (avatarUrl) {
    return (
      <img
        src={avatarUrl}
        alt={name}
        className={`${sizeClasses[size]} rounded-full object-cover`}
      />
    )
  }

  return (
    <div className={`${sizeClasses[size]} rounded-full bg-gradient-to-br ${colors[colorIndex]} flex items-center justify-center text-white font-bold shrink-0`}>
      {initials}
    </div>
  )
}

export default UserAvatar
