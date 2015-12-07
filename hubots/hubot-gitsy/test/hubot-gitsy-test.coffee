chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'baronbogo', ->
	beforeEach ->
		@robot =
			respond: sinon.spy()
			hear: sinon.spy()

		require('../src/hubot-gitsy')(@robot)

	it 'registers a respond listener - list projects', ->
		expect(@robot.respond).to.have.been.calledWith(/projects/i)

	it 'registers a respond listener - issues for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/issues for (.*)/i)

	it 'registers a respond listener - issue <issure id> for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/issue (.*) for (.*)/i)

	it 'registers a respond listener - prs for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/prs for (.*)/i)

	it 'registers a respond listener - pr by id for <project>', ->
		expect(@robot.respond).to.have.been.calledWith(/pr (.*) for (.*)/i)

	it 'registers a respond listener - list snippets for <user>', ->
		expect(@robot.respond).to.have.been.calledWith(/snippets for (.*)/i)

	it 'registers a respond listener - single snippet for <user>', ->
		expect(@robot.respond).to.have.been.calledWith(/snippet (.*) for (.*)/i)



