# Description:
#   Powell's 6-step Plan to NPM Happiness
#
# Commands:
#   hubot docker bliss - Make hubot explain how to achieve docker bliss when things go wrong
#
# Notes:
#   Script made by Gangstead.  These rules were provided by Powell Kinney at Vinli:
#   hhttps://gist.github.com/pkinney/967999b892a73059dcc7

dockerBliss = [
  "1. Do what the error says",
  "2. `rm -rf node_modules && npm install` (if in Ember.js - `rm -rf bower_components  && bower install`)",
  "3. `rm -rf node_modules && rm -rf ~/.npm && npm install`",
  "4. Reinstall node and npm.",
  "5. Format your hard drive",
  "6. Buy a new computer"
]

npmHappiness = [
  "1. Do what the error says",
  "2. `docker kill \\$(docker ps -a -q) && docker rm \\$(docker ps -a -q)`",
  "3. `boot2docker down && boot2docker up`",
  "4. `boot2docker destroy && boot2docker init && boot2docker up`",
  "5. Format your hard drive",
  "6. Buy a new computer"
]

module.exports = (robot) ->
  robot.respond /(d|D)ocker( )?(b|B)liss/i, (msg) ->
    msg.send dockerBliss.join('\n')

  robot.respond /(N|n)(P|p)(M|m)( )?(H|h)ap(p)iness/i, (msg) ->
    msg.send npmHappiness.join('\n')
