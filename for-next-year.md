
# Lessons on using git/GitHub

The git portion of the lesson wasn't as successful as it could have been.

Overall, lots of things got messed up and made using git and GitHub probably seem more complicated than is worth the effort.

The major problem was students resolving merge conflicts on their machines. There were several contributors:
* On Windows/Ubuntu machines, the default merge tool is quite unfriendly
    * Atom might be able to help with this - could teach merge conflict resolution and make them do one on day 1
* Matlab Live Scripts are binary and can't be merged
* Mistakes were made in the management of the repo
    * Files from vstudent got merged into master. Deletion of these files in master, when merged into vstudent, tried to delete files which were supposed to be there.
    * Files were merged from a student's exercises branch into master accidentally
    * Care needs to be taken with approving pull requests

The right way to avoid these issues is probably good use of branching. Ideally, students would have a master branch which they never make changes to (and will therefore fast-forward whenever they pull). Then a new branch would be made every morning, after pulling from master. Most conflicts would be avoided that way.

The easy way to avoid these issues would be to remove the students from fully using git. Some options:
* Tessa suggests that everything can be done through the Github web interface
* Let students pull down repo + changes, but make them work on copies of files outside the repo. No pushing --- pull requests could be used to keep individual student repos up to date with allardjun, commit for mad lib could be done on Github
* Use a desktop app

Matlab Live Scripts being binary is a pain. Additionally one student had an issue where their copy of Matlab failed to render the live script and came up with a Chrome error. For the future, we recommend not using them. Markdown+regular .m file is probably better (or use Jupyter --- possibly with a Matlab kernel if want to stick with Matlab code [link](https://github.com/imatlab/imatlab) or [other link](https://github.com/calysto/matlab_kernel)).

# Individual lessons

There are comments at the end of .md files:

* [git-lecture.md](Day%201/git_lecture/git-lecture.md)
* [project-set-up.md](Day%201/project-set-up.md)
