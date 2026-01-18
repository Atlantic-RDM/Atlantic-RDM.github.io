# Suggested Workflow

## 1 Clone the repository

## 2 Update

Ensure your local repository is up to date with `remote`

```
$ git pull
```

## 3 Create a local branch

All of our repositories are comprised of only a single branch `main`. We don't want to be working directly on `main` if we can avoid it. So we\'ll create a branch that we can work in, we\'ll then merge this branch back into the `main` branch that is on our local computer and lastly we\'ll push these edits to the `main` branch at `remote`. This way, any merge conflicts that we\'re resolving will be entirely local to our machine.

```
$ git checkout -b yourNewBranchNameHere
```

With `checkout -b` your new branch will be both created and you\'ll be automatically switched over to it.

## 4 Have a look around

Figure out where you\'re at:

```
$ git status

On branch yourNewBranchNameHere
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	.Rhistory
	.Rproj.user/

nothing added to commit but untracked files present (use "git add" to track)
```

Get some broader scope of all of your local branches (you\'re on the \* branch)

```
$ git branch

  main
* yourNewBranchNameHere
```

## 5 Make your edits

Make your edits in your new branch, `git add` and `git commit -m` these when you\'re done.

```
$ git switch yourNewBranchNameHere # in case you're not already there

$ touch myNewFile.md # make or edit something

$ git add myNewFile.md # stage that edit

$ git commit -m 'added myNewFile.md' # commit that edit
```

**Note** When you build the RMarkdown site in your new branch, you don't want to `add` or `commit` the output that is directed to `website/` or `docs/`, so make you sure that you only `add` the .Rmd files that you edited. This is save trouble with resolving conflicts in the html files.

## 6 Update

Next, we ensure that our main branch is still up to date. Switch over to `main` and `pull`

```
$ git switch main

Switched to branch 'main'

$ git pull
```

## 7 Local merge

Now we merge the changes in `yourNewBranchNameHere` with your local `main`. Making sure we\'re still in `main`

```
$ git switch main

Switched to branch 'main'

$ git merge yourNewBranchNameHere

Updating a4a08f9..191c190
Fast-forward
 myNewFile.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 this.md
```

It's at this point that we might encounter a merge conflict. The nature of the error will depend on where you are in the git queue. Read the section on resolving merge conflicts to sort these out before pushing to the server. In the mean time, let's assume things are smooth and check things out

```
$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	.Rhistory
	.Rproj.user/

nothing added to commit but untracked files present (use "git add" to track)
```

## 8 Build the site in `main`

Now we build the site in `main`, and again do an `add` and `commit` to get the rendered html files in `website/` or `docs/` tracked in git and ready for upload to GitHub.

## 9 Push to GitHub

And finally we\'ll send everything up to the server with `push` which does a server merge

```
$ git push
```

## 10 Tidy up

Now that we\'re done with our branch we can delete it.

```
$ git branch -d yourNewBranchNameHere
```

And we\'re done. Yay!

