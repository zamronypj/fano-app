{-----------------------------------------------
  register HelloController inside
  dependency container
------------------------------------------------}
container.add('helloController', THelloControllerFactory.create());
