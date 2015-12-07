#
githubot = require('githubot')
pad   = require('pad')
githubevents = require('hubot-github-repo-event-notifier')

module.exports = (robot) ->
	github = githubot(robot)
	limit = 20
	our_repo = 'rocketchat/Rocket.Chat'
	# console.log 'You must call me by my name - ' + robot.name
	# console.log 'If you are curious, I am listening to  ' +  robot.listeners.length + ' source'

	# hook events handler
	githubevents(robot)

	disp_issues = (issues, pullreq) ->
		output = '```\n'
		count = 0
		for g in issues

			if g.pull_request?
				if pullreq == true
					output = output + pad( '' + g.number, 8)  + pad(g.user.login, 20) + '  '  + g.title + '\n'
					count++
					if (count >= limit)
						output = output + 'MORE ...\n'
						break
			else
				if pullreq
					continue
				output = output + pad( '' + g.number, 8)  + pad(g.user.login, 20) + '  '  + g.title + '\n'
				count++
				if count >= limit
					output = output + 'MORE ...\n'
					break
		output = output + '```'
		return output

	disp_issue = (issue) ->
		issueText = "Issue"

		if issue.pull_request?
			issueText = "Pull Request"

		output = """
		#{issueText}: \##{issue.number}
		Opened by: #{issue.user.login}
		Title: #{issue.title}
		Status: #{issue.state}
		Url: #{issue.html_url}
		Body:
			#{issue.body}
		"""
		return output

	robot.respond  /intro baronbogo/i, (res) ->
			reply = ""
			reply += "Hi, my name is baronbogo, and I am the Rocket.Chat GitHub integration bot.\n"
			reply += "You can add me for your own public or private GitHub projects.\n"
			reply += "Find my code here:\n"
			reply += "https://github.com/RocketChat/Rocket.Chat.Ops/tree/master/hubots/hubot-baronbogo\n"
			reply += "I can do webhooks, issues, merge requests, and gists out of the box.\n"
			reply += "Please add to my abilities and contribute your code to Rocket.Chat.\n"
			reply += "our prs - list open merge requests for the project\n"
			reply += "our issues - list open issues for the project\n"
			reply += "our issue n - show issue n for the project\n"
			reply += "gits for <userid> - list gists for specified GitHub user\n"
			reply += "pr n for m - show merge request #n  for project #m\n"
			reply += "issue n for m - show issue #n for project #m\n"
			reply += "get gist n for m - view gist #n for user #m\n"
			res.send reply


	robot.respond /issues for (.*)/i, (res) ->
		url = "https://api.github.com/repos/" + res.match[1] + "/issues?state=open"

		github.get url, (issues) ->
			res.send disp_issues(issues, false)


	robot.respond /our issues/i, (res) ->
		url = "https://api.github.com/repos/" + our_repo + "/issues?state=open"

		github.get url, (issues) ->
			res.send disp_issues(issues, false)


	robot.respond /prs for (.*)/i, (res) ->
		url = "https://api.github.com/repos/" + res.match[1] + "/issues?state=open"

		github.get url, (issues) ->
			res.send disp_issues(issues, true)

	robot.respond /our prs/i, (res) ->
		url = "https://api.github.com/repos/" +  our_repo + "/issues?state=open"

		github.get url, (issues) ->
			res.send disp_issues(issues, true)

	robot.respond /(pr|issue) (.*) for (.*)/i, (res) ->
		url = "https://api.github.com/repos/" + res.match[3] + '/issues/' + res.match[2]

		github.get url, (issue) ->
			res.send disp_issue(issue)

	robot.respond /our (pr|issue) (.*)/i, (res) ->
		url = "https://api.github.com/repos/" + our_repo + "/issues/" + res.match[2]

		github.get url, (issue) ->
			res.send disp_issue(issue)


	robot.respond /get gists for (.*)/i, (res) ->
		url = "https://api.github.com/users/" + res.match[1] + "/gists"
		#  console.log 'url' + url
		github.get url, (gists) ->
			count = 1
			output = '```\n'
			for g in gists
				output = output + pad( '' + count, 8)  + g.description + '\n'
				count++
			output = output + '```'
			res.send output

	# handle gists
	robot.respond /get gist (.*) for (.*)/i, (res) ->
		url = "https://api.github.com/users/" + res.match[2] + "/gists"
		#  console.log 'url' + url
		github.get url, (gists) ->
			github.get "https://api.github.com/gists/" + gists[parseInt(res.match[1]) - 1].id, (gist) ->
				# console.log JSON.stringify gist
				for k,v of gist.files
					output = '```\n#ops:openeditor\n\n' + v.content + '\n```'
					res.send output



		

