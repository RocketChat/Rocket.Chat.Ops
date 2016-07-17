hubot-gitsy
===========

Gitsy is Rocket.Chat's Hubot for GitLab Integration

Gitsy can perform the following (and you can extend Gitsy readily by modifying its scripts):

* list all projects accessible
* get all the PRs for a project
* get a specific PR for a project
* get all the open issues for a project
* get a specific issue for a project
* get the snippets for a project
* view a specific snippet for a project
* announce when events occurs with a monitored project (such as creation or modification of PR, issue, branch, comment, and so on)

# Installation

For this script to take effect, you must first have your [hubot environment up and running](https://hubot.github.com/docs/), then install Gitsy with:

```
npm install --save hubot-gitsy
```

Next, you must edit the `external-scripts.json` file to load Gitsy:

```
[
  ...
  "hubot-gitsy"
]
```

You will also need to configure Gitsy for your GitLab projects.


#Configuration

You can configure Gitsy via environment variables.


##ENV

#####GITLAB_URL

The GitLab host that Gitsy will connect to.  It can be your own Community Edition server, or your projects on gitlab.com:

For example:

```
GITLAB_URL="https://mygitlabserver:3000/"
```

#####GITLAB_API_KEY

The API key to allow Gitsy to access a GitLab account.  Obtain an API key from your GitLab account.  If you are an administrator, you can get an API key for the entire server, with visibility to all projects; as a user, your API key can only access your own project(s).

For example:

```
GITLAB_API_KEY="aaaefadafasfasfasfafafasfa"
```

##OTHER Required ENV variables

Gitsy handles incoming webhook events using the excellent [hubot-gitlab-hooks npm module](https://www.npmjs.com/package/hubot-gitlab-hooks).   You must configure the additional ENV variables required by this module for the webhook handling to operate correctly.

#Operation

You can learn about the commands available by asking Gitsy for an introduction.

Note that you must use the name you gave to your bot (assumed to be _hubot_ here):

```
hubot intro gitsy
```



