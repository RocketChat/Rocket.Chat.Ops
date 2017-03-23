hubot-baronbogo
===============

BaronBogo is Rocket.Chat's Hubot for GitHub Integration

BaronBogo can perform the following with a public project repository on GitHub (and you can extend BaronBogo readily by modifying its scripts):

* get all the PRs 
* get a specific PR 
* get all the open issues 
* get a specific issue 
* get the gists for a user
* view a specific gist for a user
* announce when events occurs  (such as creation or modification of PR, issue, branch, comment, wiki edits, and so on)

# Installation

For this script to take effect, you must first have your [hubot environment up and running](https://hubot.github.com/docs/), then install BaronBogo with:

```
npm install --save hubot-baronbogo
```

Next, you must edit the `external-scripts.json` file to load BaronBogo:

```
[
  ...
  "hubot-baronbogo"
]
```

You will also need to configure BaronBogo for your GitHub team or project.


# Configuration

You can configure BaronBogo via environment variables.


## ENV

### REPOSITORY_NAME

The public GitHub project that BaronBogo will work with. Note you only need the user and repo name to specify the project:

For example:

```
REPOSITORY_NAME="rocketchat/Rocket.Chat"
```

## OTHER Required ENV variables

BaronBogo handles incoming webhook events using the excellent [hubot-github-repo-event-notifier](https://www.npmjs.com/package/hubot-github-repo-event-notifier) npm module.   You must configure the additional ENV variable `HUBOT_GITHUB_EVENT_NOTIFIER_TYPES` as required by this module for the webhook handling to operate correctly.  The author of BaronBogo is also an active contributor to this project.

# Operation

You can learn about the commands available by asking BaronBogo for an introduction.

Note that you must use the name you gave to your bot (assumed to be _hubot_ here):

```
hubot intro baronbogo
```
