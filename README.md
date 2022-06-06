# octave.org website repository from 2001 to 2016.

Since the Octave website is officially hosted on gnu.org/software/octave since about 2001, the [Concurrent Versions System (CVS)](https://en.wikipedia.org/wiki/Concurrent_Versions_System) has been used to deploy the website.

Because working with CVS is not as intuitive as newer systems like git or hg (folders are not really supported for example), I would like to preserve the history in git.

The Octave website hosting eventually moves away from Savannah and therefore, the knowledge how to tame the CVS beast might die out soon as well.

The handy tool [`git-cvsimport`](https://git-scm.com/docs/git-cvsimport) was used for this work:

```sh
git cvsimport -C octave-web-git -A authors.txt -r cvs -k -v -d siko1056@cvs.savannah.gnu.org:/web/octave octave
cd octave-web-git
git reset --hard 2e1b06737f86c402b92436b97ddca29cf59b974f
git remote add origin git@github.com:gnu-octave/octave.org-2001-2016.git
git branch -M main
git push -u origin main
```

The result can be seen here:

https://github.com/gnu-octave/octave.org-2001-2016

The current website is hosted at:

https://github.com/gnu-octave/gnu-octave.github.io
