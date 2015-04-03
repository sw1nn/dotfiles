#!/usr/bin/env python

from json import loads
from requests import get
from hurry.filesize import size, si

aa_info = loads(get('https://chaos.aa.net.uk/info?JSON').text)

quota_left = int(aa_info['login'][0]['broadband'][0]['quota_left'])
quota_amount = int(aa_info['login'][0]['broadband'][0]['quota_monthly'])

print("{0} / {1}".format(size(quota_left, system=si),
                         size(quota_amount, system=si)))
