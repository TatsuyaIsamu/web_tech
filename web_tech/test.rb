require "webrick"
server = WEBrick::HTTPServer.new({
  :DocumentRoot => ".",
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => "3000",
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount("/", WEBrick::HTTPServlet::ERBHandler, "top.html.erb")
server.mount("/indicate.cgi", WEBrick::HTTPServlet::CGIHandler, "indicate.rb")
server.mount("/goya.cgi", WEBrick::HTTPServlet::CGIHandler, "goya.rb")
server.mount("/bad.cgi", WEBrick::HTTPServlet::CGIHandler, "bad.rb")
server.mount("/gift.cgi", WEBrick::HTTPServlet::CGIHandler, "gift.rb")
server.start
