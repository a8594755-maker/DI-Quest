import { supabase } from './supabase'

/**
 * Call DeepSeek API via Supabase Edge Function
 * @param {Array<{role: string, content: string}>} messages
 * @param {string} model - "deepseek-chat" or "deepseek-reasoner"
 * @returns {Promise<string>} assistant reply content
 */
export async function chatWithDeepSeek(messages, model = 'deepseek-chat') {
  const { data, error } = await supabase.functions.invoke('deepseek-chat', {
    body: { messages, model },
  })

  if (error) throw error

  if (data.error) throw new Error(data.error.message || data.error)

  return data.choices[0].message.content
}
