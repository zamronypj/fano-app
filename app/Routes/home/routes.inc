router.get(
    '/',
    THelloController.create(
        routeMiddlewares.getBeforeMiddlewares(),
        routeMiddlewares.getBeforeMiddlewares(),
        TTemplateFileView.create(
            container.get('outputBuffer') as IOutputBuffer,
            container.get('templateParser') as ITemplateParser,
            extractFilePath(getCurrentDir()) + '/Templates/Hello/index.html'
        ),
        (TViewParameters.create())
            .setVar('baseUrl', config.getString('baseUrl'))
            .setVar('name', 'Fano')
            .setVar('appName', config.getString('appName'))
    )
);
