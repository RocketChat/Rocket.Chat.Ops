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
* real time feeds, connected via chat fabric, p2p direct from source <--> sinks into UI widget(s) on fly-ins
* modular, non-intrusive, integration with the mainstream Rocket.Chat core
* bots backwards compatible with Rocket.Chat core
* extension is per-room customizable, for example: one room for open source project Rocket.Chat developers via github integration, another for MineCraft server farms operators discussion and network monitoring, yet another for a drone delivery service's fleet monitoring and control 

![Two additional fly-in panels](https://cloud.githubusercontent.com/assets/122633/9616015/c435a816-50c9-11e5-90d8-53935a1fa3ab.png)

![Full syntax highlighted text editor on a fly-in](https://cloud.githubusercontent.com/assets/122633/9616075/2d6b419c-50ca-11e5-8eef-3d378250396d.png)

### Current status
* proof of concept is work in progress
* fly-in panels, including editor for github/gitlab integrations, are available
* syncs with this branch on Rocket.Chat core : https://github.com/RocketChat/Rocket.Chat/tree/chatops-ui-rightpanel-flexchrome
* this is the roadmap for our initial integration, targeted for after 1.0 release of Rocket.Chat core : https://github.com/RocketChat/Rocket.Chat/issues/525
 

[![Test Coverage](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops/badges/coverage.svg)](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops/coverage)
[![Code Climate](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops/badges/gpa.svg)](https://codeclimate.com/github/RocketChat/Rocket.Chat.Ops)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/RocketChat/Rocket.Chat/raw/master/LICENSE)

