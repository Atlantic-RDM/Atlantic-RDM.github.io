# Merge Conflicts

## Scenario 1

Working in branch `main` locally...

### Getting up to Date

Before you can `push` from your local branch to the branch on the server, you need to be up to date with the server. If you try to `push` and there are changes on the server that your local git is not aware of, you\'ll see

```
$ git push
To github.com:ubco-biology/repositoryNameHere.git
 ! [rejected]        main -> main (fetch first)
```

Git tells us what to do here, `fetch`. `fetch` only updates metadata about what changes have occurred though, it doesn't integrate these changes. In our simple workflow, we want to `pull` which runs both `fetch` and `merge` so that all changes are integrated locally.

So let\'s

```
$ git pull
```

#### Scenario 1

If all the changes on the server were to different files or different parts of the files from your own local changes you'll be prompted with git forcing you to make a `commit` message as you are now committing a remote change to your local repository. There's a good chance on a Mac that this will open in Vim. Learn about Vim basics here. Anyway, add a `commit` message, save and you should be good

```
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 661 bytes | 165.00 KiB/s, done.
From github.com:ubco-biology/repositoryName.git
   6f0ff84..e29843b  main       -> origin/main
Merge made by the 'recursive' strategy.
 serverModifiedFile.md | 2 ++
 1 file changed, 2 insertions(+)
```

And you can now make your own contributions back to the server

```
$ git push
```

#### Scenario 2

However, if you\'ve made changes locally that conflict with what\'s on the server, you\'ll see something like

```
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 640 bytes | 128.00 KiB/s, done.
From github.com:ubco-biology/repositoryNameHere
   d4c54c4..b3c05e3  main       -> origin/main
Auto-merging conflictingFileName.md
CONFLICT (content): Merge conflict in conflictingFileName.md
Automatic merge failed; fix conflicts and then commit the result.
```

Line 8 tells us a merge is being attempted, line 9 tells us a conflict has been identified and which file this conflict is in, line 10 asks us to resolve the conflict.

### Resolving merge conflicts

Running `status` will give you a bit more information

```
$ git status
On branch main
Your branch and 'origin/main' have diverged,
and have 1 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)

You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
	both modified:   conflictingFileName.md

no changes added to commit (use "git add" and/or "git commit -a")
```

Let\'s open the offending file in a text editor and you\'ll see something like this

```
A bunch of text like this and the all of a sudden

<<<<<<< HEAD
Stay here!
=======
Go away!
>>>>>>> b3c05e36a0b0772b5ecd239e1b701a024ea76543

and then more text
```

Git wraps conflicting edits in `<<<<<<< >>>>>>>` The content between `<<<<<<< HEAD` and `=======` will be the content sitting on the server. The content between `=======` and `>>>>>>>` and the numbers / file name after that will be on your local machine. Your job is to decide what to keep and what to get rid of; you can resolve this conflict in any way you choose. So you could opt for

```
A bunch of text like this and the all of a sudden

Go away!

and then more text
```

because your edit is the correct one. Or you could opt for

```
A bunch of text like this and the all of a sudden

Stay here! No, wait. Go away!

and then more text
```

because you think that's actually a better solution! Anyway, make your decision, remove all of the `<<<<<<< HEAD ======= >>>>>>> b3c05e36a0b0772b5ecd239e1b701a024ea76543` content, and save your file. 

We then use `add` to mark the file as resolved, `commit` and `push`

```
$ git add conflictingFileName.md

$ git commit -m 'resolve conflict'
[main b8bcf4d] resolve conflict

$ git push
```

## Scenario 2

Using our [Suggested Workflow](https://github.com/ubco-biology/Getting-started/blob/main/03_Suggested-Workflow.md)...

### Getting up to Date

You should never have changes in your `main` branch and changes in the remote `main` branch as you will always be pulling updates from remote `main` to local `main` before merging your local `working` branch into your local `main` branch. So pulls and pushed should be straight forward.

### Resolving merge conflicts

Where you will see conflicts though, is when you merge your local `working` branch with your local `main` branch before you `push` to the server.
