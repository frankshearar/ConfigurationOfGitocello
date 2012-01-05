Install [Gitocello](https://github.com/timfel/gitocello) in Squeak:

    Installer ss3
        project: 'Gitocello-fbs';
        install: 'ConfigurationOfGitocello'.

    (Smalltalk at: #ConfigurationOfGitocello) load.

Install Gitocello in Pharo:

    Gofer it
        url: 'http://ss3.gemstone.com/ss/Gitocello-fbs';
        package: 'ConfigurationOfGitocello';
        load.

    (Smalltalk at: #ConfigurationOfGitocello) load.