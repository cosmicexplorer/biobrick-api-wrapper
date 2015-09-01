http = require 'http'
XmlStream = require 'xml-stream'

getPartSeq = (name, cb) ->
  http.get "http://parts.igem.org/cgi/xml/part.cgi?part=#{name}", (resp) ->
    new XmlStream(resp).on 'updateElement: seq_data', (seq) -> cb seq.$text

getPartSeq "pSB2K0", (seq) ->
  process.stdout.write seq + '\n'
