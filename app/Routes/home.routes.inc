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

            //TODO need to be set independently
            //ExtractFilePath(getCurrentDir()) + '/Templates/Hello/landing.html'
            getCurrentDir() + '/app/Templates/Hello/landing.html'
        ),
        (TViewParameters.create()).setVar('baseDir', 'http://fano.zamroni')
    )
);
