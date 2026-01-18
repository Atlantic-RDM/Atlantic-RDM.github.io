# Troubleshooting

## Configuring remote

First, check the output of

```
git remote -v
```

It should read something like

```
origin	git@github.com:ubco-biology/RepositoryName.git (fetch)
origin	git@github.com:ubco-biology/RepositoryName.git (push)
```

If it reads `https` or just `github.com` you can run the following

```
git remote set-url origin git@github.com:ubco-biology/RepositoryName.git
```