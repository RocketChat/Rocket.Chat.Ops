#

module.exports = (robot) ->
	github = require('githubot')(robot)
	pad = require('pad')



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


	robot.respond /get gist (.*) for (.*)/i, (res) ->
		url = "https://api.github.com/users/" + res.match[2] + "/gists"
		#  console.log 'url' + url
		github.get url, (gists) ->
			github.get "https://api.github.com/gists/" + gists[parseInt(res.match[1]) - 1].id, (gist) ->
				# console.log JSON.stringify gist
				for k,v of gist.files
					output = '```\n#ops:openeditor\n\n' + v.content + '\n```'
					res.send output
		
