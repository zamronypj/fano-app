router.get(
    '/',
    THelloController.create(
        TTemplateFileView.create(
            appDependencyContainer.get('outputBuffer') as IOutputBuffer,
            ExtractFilePath(getCurrentDir()) + '/Templates/Hello/index.html'
        ),
        TViewParameters.create()
    )
);
