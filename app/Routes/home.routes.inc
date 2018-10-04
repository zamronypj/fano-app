router.get(
    '/',
    THelloController.create(
        TTemplateFileView.create(
            getCurrentDir() + '/app/Templates/Hello/index.html'
        ),
        TViewParameters.create()
    )
);
