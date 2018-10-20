{-----------------------------------------------
  setup output buffer instance
------------------------------------------------}
container.add('outputBuffer', TOutputBufferFactory.create());

{-----------------------------------------------
  setup html template parser
------------------------------------------------}
container.add('templateParser', TTemplateParserFactory.create());

{-----------------------------------------------
  setup global view parameters
------------------------------------------------}
container.add('viewParams', TViewParametersFactory.create());
