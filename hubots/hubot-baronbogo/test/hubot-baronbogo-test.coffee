chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'baronbogo', ->
	beforeEach ->
		process.env['REPOSITORY_NAME'] = 'a'

		@robot =
			respond: sinon.spy()
			hear: sinon.spy()


		require('../src/hubot-baronbogo')(@robot)

	it 'registers a respond listener - issues for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/issues for (.*)/i)

	it 'registers a respond listener - our issues', ->
		expect(@robot.respond).to.have.been.calledWith(/our issues/i)

	it 'registers a respond listener - prs for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/prs for (.*)/i)

	it 'registers a respond listener - our prs', ->
		expect(@robot.respond).to.have.been.calledWith(/our prs/i)

	it 'registers a respond listener - issue or pr by id for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/(pr|issue) (.*) for (.*)/i)

	it 'registers a respond listener - our pr or issue by id', ->
		expect(@robot.respond).to.have.been.calledWith(/our (pr|issue) (.*)/i)

	it 'registers a respond listener - gists for <user>', ->
		expect(@robot.respond).to.have.been.calledWith(/get gists for (.*)/i)

	it 'registers a respond listener - single gist for <user>', ->
		expect(@robot.respond).to.have.been.calledWith(/get gist (.*) for (.*)/i)



