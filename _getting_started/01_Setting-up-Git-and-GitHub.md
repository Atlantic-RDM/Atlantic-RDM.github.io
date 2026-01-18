# Getting Started

Pro Git book, written by Scott Chacon and Ben Straub

https://git-scm.com/

**NOTE** These instructions are written for a user without a pre-existing GitHub account or install of git on their computer. If you already have a GitHub account and / or you have git installed on your computer, you should head to https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh for more elaborate instructions.

## Get a GitHub Account

Head to https://github.com and sign up.

## Install and Configure git Locally

### Install {-}

**Mac OS**

Open Terminal and type

```
git --version
```

If git is installed, you'll get version information. If it's not, you'll be prompted to install it. [Source](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

**Windows**

Download and install from here https://git-scm.com/download/win

### Configure {-}

If you're on a mac, open Terminal. If you're on Windows, click the start menu and start to type <code>git bash</code>. Thereafter, everything's the same.

Type

```
git config --global user.name "Your Name Here"
git config --global user.email "youremail@here.com"
```

Your local environment will now associate any git projects you have with this name and email. This is the name that will appear when you push a change to GitHub.

## Authenticate Your Device

You\'ll need to make sure that your device is recognized for pushing content to GitHub. We'll do this with SSH.

These instructions are derived from here: https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh

### Generate an SSH Key {-}

Open Terminal or Git Bash and type

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

When you're prompted to \"Enter a file in which to save the key,\" press Enter. This accepts the default file location.

At the prompt, type a secure passphrase. Remember this passphrase however you remember your passwords.

### Add the SSH Key to the ssh-agent {-}

Start the ssh-agent

```
eval "$(ssh-agent -s)"
```

#### Mac Users Only {-}

Everyone else skip ahead...

Now we'll edit your ssh config file. First we need to create it:

```
touch ~/.ssh/config
```

Then we'll open it:

```
open -e ~/.ssh/config
```


And we'll add the following to the file:

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

Save it and close it.

#### Everyone Now {-}

Add your SSH private key to the ssh-agent and store your passphrase in the keychain.

```
ssh-add -K ~/.ssh/id_ed25519
```

That's everything we need to do locally. Now we need to connect this with our online GitHub account.

**NOTE** If you encounter an error like the following at this stage, don\'t worry about it, just continue on and everything should work

```
$ ssh-add -K ~/.ssh/id_ed25519
Enter PIN for authenticator:
Provider "internal" returned failure -1
Unable to load resident keys: invalid format
```

### Adding an SSH key to a GitHub Account {-}

Copy your SSH public key to your clipboard:

Mac users:

```
open -e ~/.ssh/id_ed25519.pub
```

Windows users:

```
notepad ~/.ssh/id_ed25519.pub
```

Select all text and copy by your preferred method.

Login to your GitHub account at https://github.com. Click on your profile photo in the upper right corner once you're logged in and head to \'Settings\'.

In your \'Settings\' head to \'SSH and GPG Keys\'.

Click **New SSH key** or **Add SSH key**.

In the \"Title\" field, add a descriptive label for the new key. Remember, this is to authenticate your device; if you use more than once device, make sure you use a useful name for the device you're currently setting this up for. For  example, if you're using a personal Mac, you might call this key  \"Personal MacBook Air\".

Paste the key currently stored on your clip board into the \"Key\" field.

Wrap things up by selecting \'Add SSH Key\'. You may be prompted for your password.

You're now fully authenticated and ready to start pushing content from your local git repositories on your computer to your GitHub account online.
