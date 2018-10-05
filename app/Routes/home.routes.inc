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
            .setVar('baseDir', 'http://fano.zamroni')
            .setVar('name', 'zzzaam')
    )
);
