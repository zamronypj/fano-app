router.get(
    '/',
    THelloController.create(
        routeMiddlewares.getBeforeMiddlewares(),
        routeMiddlewares.getBeforeMiddlewares(),
        TTemplateFileView.create(
            appDependencyContainer.get('outputBuffer') as IOutputBuffer,

            //replace any variable {{ variableName }} with value
            TTemplateParser.create(
                TRegex.create(),
                '{{',
                '}}'
            ),

            //TODO need to be set independently
            //ExtractFilePath(getCurrentDir()) + '/Templates/Hello/index.html'
            getCurrentDir() + '/app/Templates/Hello/index.html'
        ),
        (TViewParameters.create())
            .setVar('baseUrl', 'http://fano.zamroni')
            .setVar('name', 'Fano')
            .setVar('appName', 'Fano Web Framework')
    )
);
