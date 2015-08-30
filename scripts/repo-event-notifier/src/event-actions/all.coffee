#! /usr/bin/env coffee

#commit_comment,create,delete,deployment,deployment_status,fork,gollum,issue_comment,issues,member,membership,page_build,pull_request_review_comment,pull_request,push,repository,release,status,ping,team_add,watch

unique = (array) ->
  output = {}
  output[array[key]] = array[key] for key in [0...array.length]
  value for key, value of output

extractMentionsFromBody = (body) ->
  mentioned = body.match(/(^|\s)(@[\w\-\/]+)/g)

  if mentioned?
    mentioned = mentioned.filter (nick) ->
      slashes = nick.match(/\//g)
      slashes is null or slashes.length < 2

    mentioned = mentioned.map (nick) -> nick.trim()
    mentioned = unique mentioned

    "\nMentioned: #{mentioned.join(", ")}"
  else
    ""

buildNewIssueOrPRMessage = (data, eventType, callback) ->
  pr_or_issue = data[eventType]
  if data.action == 'opened'
    mentioned_line = ''
    if pr_or_issue.body?
      mentioned_line = extractMentionsFromBody(pr_or_issue.body)
    callback "New #{eventType.replace('_', ' ')} \"#{pr_or_issue.title}\" by #{pr_or_issue.user.login}: #{pr_or_issue.html_url}#{mentioned_line}"

module.exports =
  commit_comment: (data, callback) ->
      comment = data.comment

      callback ""

  create: (data, callback) ->
      repo = data.repository

      callback ""

  delete: (data, callback) ->
      repo = data.repository

      callback ""

  deployment: (data, callback) ->
      deploy = data.deployment
      repo = data.repository

      callback ""

  deployment_status: (data, callback) ->
      deploy = data.deployment
      deploy_status = data.deployment_status
      repo = data.repository

      callback ""

  fork: (data, callback) ->
      forkee = data.forkee
      repo = data.repository

      callback ""

  gollum: (data, callback) ->
      pages = data.pages
      repo = data.repository

      callback ""

  issues: (data, callback) ->
      issue = data.issue
      repo = data.repository

      mentioned_line = extractMentionsFromBody(issue.body)

      callback "New issue \##{issue.number} \"#{issue.title}\" by #{issue.user.login}: #{issue.html_url}#{mentioned_line}"

  issue_comment: (data, callback) ->
      issue = data.issue
      comment = data.comment
      repo = data.repository

      mentioned_line = extractMentionsFromBody(comment.body)

      callback "New Comment on Issue \##{issue.number} by #{comment.user.login}: \"#{comment.body}\" - #{comment.html_url}#{mentioned_line}"

  member: (data, callback) ->
      member = data.member
      repo = data.repository

      callback ""

  # Org level event
  membership: (data, callback) ->
      scope = data.scope
      member = data.member

      callback ""

  page_build: (data, callback) ->
      build = data.build
      repo = data.repository
    if build?
      if build.status is "built"
        callback "#{build.pusher.login} built #{data.repository.full_name} pages at #{build.commit} in #{build.duration}ms."
      if build.error.message?
        callback "Page build for #{data.repository.full_name} errored: #{build.error.message}."

  public: (data, callback) ->
      repo = data.repository

      callback ""

  pull_request_review_comment: (data, callback) ->
      comment = data.comment
      pull_req = data.pull_request
      base = data.base
      repo = data.repository

      mentioned_line = extractMentionsFromBody(comment.body)

      callback "New Comment on Pull Request \"#{comment.body}\" by #{comment.user.login}: #{comment.html_url}#{mentioned_line}"

  pull_request: (data, callback) ->
      pull_num = data.number
      pull_req = data.pull_request
      base = data.base
      repo = data.repository

      mentioned_line = extractMentionsFromBody(pull_req.body)

      callback "New Pull Request \"#{pull_req.title}\" by #{pull_req.user.login}: #{pull_req.html_url}#{mentioned_line}"

  push: (data, callback) ->
      commit = data.after
      commits = data.commits
      head_commit = data.head_commit
      repo = data.repository
      pusher = data.pusher

      mentioned_line = extractMentionsFromBody(issue.body)

      callback "New Commit \"#{head_commit.message}\" by #{pusher.name}: #{head_commit.url}#{mentioned_line}"

  # Org level event
  repository: (data, callback) ->
      repo = data.repository
      org = data.organization

      callback ""

  release: (data, callback) ->
      release = data.release
      repo = data.repository

      callback ""

  status: (data, callback) ->
      commit = data.commit
      state = data.state
      branches = data.branches
      repo = data.repository

      callback ""

  team_add: (data, callback) ->
      team = data.team
      repo = data.repository
      org = data.organization

      callback ""

  watch: (data, callback) ->
      repo = data.repository
      sender = data.sender

      callback ""
