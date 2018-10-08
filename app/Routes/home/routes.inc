router.get(
    '/',
    THelloController.create(
        TTemplateFileView.create(
            appDependencyContainer.get('outputBuffer') as IOutputBuffer,

            //replace any variable {{ variableName }} with value
            TTemplateParser.create(
                TRegex.create(),
                '{{',
                '}}'
            ),

            ExtractFilePath(getCurrentDir()) + '/Templates/Hello/index.html'
        ),
        (TViewParameters.create())
            .setVar('baseUrl', 'http://fano.zamroni')
            .setVar('name', 'Fano')
            .setVar('appName', 'Fano Web Framework')
    )
);
