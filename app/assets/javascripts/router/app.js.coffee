jQuery ->
  new Common()
  data = $('body').data()
  debugger
  action = data.action.camelize()
  controller = data.controller.camelize().capitalize()
  return unless typeof window[controller] == 'function'
  obj = new window[controller]
  return unless typeof obj[data.action] == 'function'
  obj[data.action]()
