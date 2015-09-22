
module.exports = (robot) ->
  gitlab = require('./gitlab')({'url': 'https://gitlab.com' , 'token': 'aLtWi5AYbMP24Nf-k6sk' })
  projectissues = require
  pad = require('pad')
  limit = 20
  our_repo = 'rocketchat/Rocket.Chat'
  # console.log 'You must call me by my name - ' + robot.name
  # console.log 'If you are curious, I am listening to  ' +  robot.listeners.length + ' source'


  robot.respond  /help gitlab/i, (res) ->
    gitlab.users.all  (users) ->
      reply = ""
      reply += "Hi, my name is gitsy, and I am the Rocket.Chat gitlab integration bot.\n"
      reply += "You can add me for your own Gitlab CE projects or Gitlab cloud public projects.\n"
      reply += "Find my code here:\n"
      reply += "https://github.com/RocketChat/Rocket.Chat.Ops/tree/master/scripts/gitlab\n"
      reply += "I can do webhooks, issues, merge requests, and snippets out of the box.\n"
      reply += "Please add to my abilities and contribute your code to Rocket.Chat.\n"
      reply += "projects - list all projects available\n"
      reply += "prs for n - list open merge requests for project #n\n"
      reply += "issues for n - list open issues for project #n\n"
      reply += "snippets for n - list snippets for project #n\n"
      reply += "pr n for m - show merge request #n  for project #m\n"
      reply += "issue n for m - show issue #n for project #m\n"
      reply += "snippet n for m - view snippet #n for project #m\n"
      res.send reply

  robot.respond  /projects/i, (res) ->
    gitlab.projects.all  (projects) ->
      reply = "```\n"
      for project, idx in projects
        # reply += "##{project.id}: #{project.name}, path: #{project.path}, default_branch: #{project.default_branch}, private: #{project.private}, owner: #{project.owner.name} (#{project.owner.email}), date: #{project.created_at}"
        reply += pad("" + (idx + 1), 8) + pad(project.name, 20)  + project.created_at + "\n"
      reply += "```"
      res.send reply


  robot.respond /issues for (.*)/i, (res) ->
    gitlab.projects.all  (projects) =>
      selproj = projects[parseInt(res.match[1]) - 1]
      # console.log "PROJECT ID " + selproj.id
      gitlab.projects.issues.list  selproj.id,  {'state': 'opened'},  (issues) ->
        reply = "```\n"
        for issue, idx in issues
          reply += pad("" + issue.iid , 8) + pad(issue.author.name,20) + issue.title + "\n"
          if idx > limit
            break
        reply += "```"
        res.send reply

  robot.respond /issue (.*) for (.*)/i, (res) ->
    gitlab.projects.all  (projects) =>
      selproj = projects[parseInt(res.match[2]) - 1]
      # console.log "PROJECT ID " + selproj.id
      gitlab.projects.issues.list  selproj.id,  {'iid': parseInt(res.match[1])},  (issues) ->
        icon = ""
        reply = "```\n"
        for issue, idx in issues
          reply += pad("Issue #" ,20) + issue.iid + "\n"
          reply += pad("Opened by" , 20) + issue.author.name + "\n"
          reply += pad("Title", 20) + issue.title + "\n"
          desc = issue.description
          if (issue.description.indexOf("**Imported") > -1)
            desc = issue.description.split("\*\*Imported")[0]
          reply += "Body:\n"  + desc + "\n"
          icon = issue.author.avatar_url
          if idx > limit
            break
        reply += "```"
        res.send reply

  robot.respond /prs for (.*)/i, (res) ->
    gitlab.projects.all  (projects) =>
      selproj = projects[parseInt(res.match[1]) - 1]
      # console.log "PROJECT ID " + selproj.id
      gitlab.projects.merge_requests.list  selproj.id,  {'state': 'opened'},  (issues) ->
        reply = "```\n"
        for issue, idx in issues
          reply += pad("" + issue.iid , 8) + pad(issue.author.name,20) + issue.title + "\n"
          if idx > limit
            break
        reply += "```"
        res.send reply

  robot.respond /pr (.*) for (.*)/i, (res) ->
    gitlab.projects.all  (projects) =>
      selproj = projects[parseInt(res.match[2]) - 1]
      # console.log "PROJECT ID " + selproj.id
      gitlab.projects.merge_requests.list  selproj.id,  {'iid': parseInt(res.match[1])},  (issues) ->
        icon = ""
        reply = "```\n"
        for issue, idx in issues
          reply += pad("Issue #",20) + issue.iid + "\n"
          reply += pad("Opened by" ,20) + issue.author.name + "\n"
          reply += pad("Title", 20) + issue.title + "\n"
          desc = issue.description
          # if (issue.description.indexOf("**Imported") > -1)
          # desc = issue.description.split("\*\*Imported")[0]
          reply += "Body:\n"  + desc + "\n"
          icon = issue.author.avatar_url
          if idx > limit
            break
        reply += "```"
        res.send reply

  robot.respond /snippets for (.*)/i, (res) ->
    gitlab.projects.all  (projects) =>
      selproj = projects[parseInt(res.match[1]) - 1]
      # console.log "PROJECT ID " + selproj.id
      gitlab.projects.listSnippets  {id: selproj.id},  (snippets) ->
        reply = "```\n"
        for snippet, idx in snippets
          reply += pad("" + snippet.id , 8) + pad(snippet.author.name,20) + snippet.title + "\n"
          if idx > limit
            break
        reply += "```"
        res.send reply

  robot.respond /snippet (.*) for (.*)/i, (res) ->
    gitlab.projects.all  (projects) =>
      selproj = projects[parseInt(res.match[2]) - 1]
      snippetid = parseInt(res.match[1])
      # console.log "PROJECT ID " + selproj.id
      gitlab.projects.getSnippet  {id: selproj.id, sid: snippetid},  (rawcode) ->
        reply = "```\n"
        reply += "# ops:gitlabopencode\n#\n"
        reply += rawcode.replace(/^\s*[\r\n]/gm, "")
        reply += "\n```"
        res.send reply
