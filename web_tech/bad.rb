require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi["bad"]
  "<html>
    <body>
      <p>室の悪いゴーヤの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}