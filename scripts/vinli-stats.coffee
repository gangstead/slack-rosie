# Description:
#   Retrieves a stats object from <service>.vin.li/api/v1/_internal/stats
#
# Dependencies:
#   None
#
# Configuration:
#   HUBUT_VINLI_STATS_INTERNAL_KEY
#
# Commands:
#   hubot vinli stats <service> - stats for a service
#
# Author:
#   gangstead

module.exports = (robot) ->
  robot.respond /vinli stats ?(.*)$/i, (msg) ->
    service = msg.match[1]
    console.log 'swg service: ' + service
    get_stats robot, msg, service, send_stats

# check cache, get data, store data, invoke callback.
get_stats = (robot, msg, service, cb) ->
  if not process.env.HUBUT_VINLI_STATS_INTERNAL_KEY?
    msg.send "HUBUT_VINLI_STATS_INTERNAL_KEY is not set. So sad."
    return
  # get new data
  auth = 'Basic ' + new Buffer('_internal:' + process.env.HUBUT_VINLI_STATS_INTERNAL_KEY).toString('base64')
  msg
    .http("https://#{service}-dev.vin.li/api/v1/_internal/stats")
    .headers(Authorization: auth, Accept: 'application/json')
    .get() (err, res, body) ->
      data = JSON.parse(body)

      if data.response?.error?
        msg.send data.response.error.description
      # looks good
      else
        cb msg, data.stats

send_stats = (msg, stats) ->
  out = JSON.stringify(stats, null, 2)
  msg.send "Here's your stats (dev environment): ```#{out}```"
