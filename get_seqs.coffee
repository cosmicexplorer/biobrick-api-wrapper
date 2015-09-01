fs = require 'fs'

biobrick = require './biobrick'

# run this through the seq checker!!!
fs.readFile 'out-file-cleaned', (err, data) ->
  throw err if err
  JSON.parse(data.toString()).map (bb) ->
    biobrick.getPartSeq bb, (name, seq) ->
