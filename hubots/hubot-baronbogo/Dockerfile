FROM node:0.12.4
MAINTAINER Sing Li <sing.li@rocket.chat>

RUN npm install -g coffee-script yo generator-hubot  &&  \
	useradd hubot -m

USER hubot

WORKDIR /home/hubot

ENV DEV false

ENV BOT_NAME "hubot"
ENV BOT_OWNER "No owner specified"
ENV BOT_DESC "Hubot with Rocket.Chat adapter"

ENV EXTERNAL_SCRIPTS=hubot-diagnostics,hubot-baronbogo

RUN yo hubot --owner="$BOT_OWNER" --name="$BOT_NAME" --description="$BOT_DESC" --defaults && \
	sed -i /heroku/d ./external-scripts.json && \
	sed -i /redis-brain/d ./external-scripts.json && \
	npm install hubot-rocketchat

CMD node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
	npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))") && \
	if $DEV; then coffee -c /home/hubot/node_modules/hubot-rocketchat/src/*.coffee; fi && \
	bin/hubot -n $BOT_NAME -a rocketchat

