![Rocket.Chat logo](https://rocket.chat/images/logo/logo-dark.svg?v3)

# Rocket.Chat.Ops

Highly customizable, bot-based, Github and Gitlab integrations and beyond.

## About

Extending Rocket.Chat into the realms of specialized _chat centric_ applications.  

Starting with a Chat Ops implementation for Github and Gitlab, but extendable to other application areas.

100% powered by hubot.

Main features:

* flexible fly-in panels that can contain arbitrary user interface
* scalable inbound event handling
* scalable outbound command dispatching
* inbound data rendered by specialized widgets on fly-ins (example: code is rendered in syntax highlighed text editor)
* real time feeds, connected by chat fabric, p2p direct data stream from source <--> sinks into UI widget(s) on fly-ins
* modular, non-intrusive, integration with the mainstream Rocket.Chat core
* bots backwards compatible with Rocket.Chat core
* extension is per-room customizable, for example: one room for open source project Rocket.Chat developers via github integration, another for MineCraft server farms operators discussion and network monitoring, yet another for a drone delivery service's fleet monitoring and control 

![Two additional fly-in panels](https://cloud.githubusercontent.com/assets/122633/9658519/09738aac-5218-11e5-9bac-612fb6c702ff.png)

![Full syntax highlighted text editor on a fly-in](https://cloud.githubusercontent.com/assets/122633/9616075/2d6b419c-50ca-11e5-8eef-3d378250396d.png)

## Ready for Contributors!

Please contrbiute to our bot based integration by adding your bots.

#### For github contributors
* no need to understand Rocket.Chat core code 
* basic familiarity with JavaScript or CoffeeScript is all that is required
* follow this [one page howto on bots scripting](https://hubot.github.com/docs/scripting/)
* code and contribute your bot into the `scripts/github` directories, examples are already included

#### For gitlab contributors
* no need to understand Rocket.Chat core code 
* basic familiarity with JavaScript or CoffeeScript is all that is required
* follow this [one page howto on bots scripting](https://hubot.github.com/docs/scripting/)
* code and contribute your bot into the `scripts/gitlab` directories, examples are already included


#### For atlassian contributors
* no need to understand Rocket.Chat core code 
* basic familiarity with JavaScript or CoffeeScript is all that is required
* follow this [one page howto on bots scripting](https://hubot.github.com/docs/scripting/)
* code and contribute your bot into the `scripts/atlassian` directories, examples are already included

#### For other custom app integration contributors
* no need to understand Rocket.Chat core code 
* basic familiarity with JavaScript or CoffeeScript is all that is required
* follow this [one page howto on bots scripting](https://hubot.github.com/docs/scripting/)
* code and contribute your bot into one single subdirectory of your own under `scripts`, follow the `github` examples 



### Current status
* proof of concept is work in progress
* fly-in panels, including editor for github/gitlab integrations, are available
* syncs with this branch on Rocket.Chat core : https://github.com/RocketChat/Rocket.Chat/tree/chatops-ui-rightpanel-flexchrome
* this is the roadmap for our initial integration, targeted for after 1.0 release of Rocket.Chat core : https://github.com/RocketChat/Rocket.Chat/issues/525
 

[![Test Coverage](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops/badges/coverage.svg)](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops/coverage)
[![Code Climate](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops/badges/gpa.svg)](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/RocketChat/Rocket.Chat/raw/master/LICENSE)

