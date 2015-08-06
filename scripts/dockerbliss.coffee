# Description:
#   Powell's 6-step Plan to NPM Happiness
#
# Commands:
#   hubot docker bliss - Make hubot explain how to achieve docker bliss when things go wrong
#
# Notes:
#   These rules were provided by Powell Kinney at Vinli:
#   hhttps://gist.github.com/pkinney/967999b892a73059dcc7

dockerBliss = [
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
