#!/home/neale/.virtualenvs/aaisp/bin/python

from json import loads
from requests import get
from hurry.filesize import size, si
from os.path import expanduser
import configparser
home = expanduser('~')

config = configparser.ConfigParser()
config.read (home + '/.config/aaisp/config')
aaisp = config['aaisp']

aa_info = loads(get('https://chaos.aa.net.uk/info?JSON').text)

login=[x for x in aa_info['login'] if x['ID'] == aaisp['login']][0]
broadband=[x for x in login['broadband'] if x['circuit'] == aaisp['circuit']][0]

quota_left = int(broadband['quota_left'])
quota_amount = int(broadband['quota_monthly'])

print("{0} / {1}".format(size(quota_amount, system=si),
                         size(quota_left, system=si)))
