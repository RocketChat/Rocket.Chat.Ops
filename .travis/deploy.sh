echo "registry=http://registry.npmjs.org/"  > ~/.npmrc
echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" >> ~/.npmrc
cd $TRAVIS_BUILD_DIR/hubots/hubot-baronbogo
npm publish
cd $TRAVIS_BUILD_DIR/hubots/hubot-gitsy
npm publish
