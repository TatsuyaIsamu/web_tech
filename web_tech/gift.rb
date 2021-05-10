require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8")  {
  get = cgi["gift"]
  "<html>
    <body>
      <p>ギフト用のゴーヤの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}