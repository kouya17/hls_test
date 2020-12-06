import os

import http.server
import socketserver

PORT = 8000

web_dir = os.path.join(os.path.dirname(__file__), '/home/pi/public')
os.chdir(web_dir)

Handler = http.server.SimpleHTTPRequestHandler
httpd = socketserver.TCPServer(("", PORT), Handler)
print("serving at port", PORT)
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass

httpd.server_close