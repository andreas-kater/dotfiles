#!/Users/andreaskater/Dev/python/venv/bin/python
# import andi
import subprocess
import os
import sys

port = sys.argv[1] if len(sys.argv) > 1 else 5000
os.system(f'ngrok http {port} > /dev/null &')
ngrok_url = subprocess.check_output(
    "curl --silent http://127.0.0.1:4040/api/tunnels | jq '.tunnels[0].public_url'", shell=True)
ngrok_url = ngrok_url.decode(
    "utf-8").replace('"', '').replace('http:', 'https:').strip()
print(ngrok_url)
# andi.Website(ngrok_url).open()
