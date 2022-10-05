[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

# Data Carpentry for Social Sciences & Humanities  - Notes for R lesson
In this repository you will find scripts and documents created during the [Data Carpentry for Social Sciences & Humanities](https://eur-nl.github.io/2022-10-24-ldev-online/) workshop organised by Leiden University, TU Delft, Erasmus University Rotterdam, VU Amsterdam on Oct 24, 25, 27, 28, 2022.

## Usage Learners 
The repository should mimic the project structure of the R project that has been created by the instructors during the Data Carpentry. Go to the file in which the instructor is now coding. You don't see the most recent lines of code? Refresh the page and the see the new commands coming in!   

## Usage Instructors 
Instructors can automatically update repository using [gitautopush](https://pypi.org/project/gitautopush/). 

### Prerequisites for the solution
To work with the solution instructors need to have the following setup ready:
- Python and pip installed
- Git installed
- GitHub account added to the repository as a Contributor 

### Steps
- `pip install gitautopush`
- clone this repository to your local directory
- if you have cloned the repository a while ago, `git pull` to avoid conflicts
- in terminal, start observing the folder by command: `gitautopush /path/to/my/repo/folder`
- you can also setup a delay between live coding and the notes in the repository by adding `--sleep <INT>` argument,  `INT` being the amount of time (in seconds) to wait in between attempts to synchronize.
- in the folder of the repository, create a new R script/ Rmarkdown and save the changes
- see if it automatically pushes to the repository
- once you finish your lesson, make sure to close `gitautopush` with `Ctrl+C`  

### Troubleshooting
- git requires authentication
- ValueError: A `git status` command didn't work, are you sure this is a git repository?

This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).


[![License: CC BY 4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/)

