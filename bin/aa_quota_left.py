#!/home/neale/.virtualenvs/aaisp/bin/python

from json import loads
from requests import post
from hurry.filesize import size, si
from os.path import expanduser
import configparser
import sys

home = expanduser('~')

config = configparser.ConfigParser()
config.read(home + '/.config/aaisp/config')
aaisp = config['aaisp']

aa_info = loads(post('https://chaos2.aa.net.uk/broadband/quota',
                     data={'control_login': aaisp['login'],
                           'control_password': aaisp['password'],
                           'service': aaisp['service']}).text)

quota = aa_info['quota'][0]
quota_remaining = int(quota['quota_remaining'])
quota_monthly = int(quota['quota_monthly'])
quota_timestamp = quota['quota_timestamp']

output = "{0} / {1} at {2}".format(size(quota_remaining, system=si),
                                   size(quota_monthly, system=si),
                                   quota_timestamp)

if len(sys.argv) > 1:
    with open(sys.argv[1], "w") as f:
        f.write(output)
        f.write('\n')
else:
    print(output)
