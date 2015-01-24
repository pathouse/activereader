jQuery ->
  new Common()
  data = $('body').data()
  action = data.action
  controller = data.controller.camelize()
  return unless typeof window[controller] == 'function'
  obj = new window[controller]
  return unless typeof obj[data.action] == 'function'
  obj[data.action]()
