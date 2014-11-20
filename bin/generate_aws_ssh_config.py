#!/usr/bin/env python2
'''
@author Bommarito Consulting, LLC
@date 2012-12-23

Generate .ssh/config lines from EC2 instance information.
'''

# Imports
import boto.ec2
import os
import ConfigParser
from os.path import expanduser
import re

# Default user
defaultUser = 'ec2-user'

# Default key path
userHome = expanduser("~")
defaultKeyPath = os.path.join(userHome, '.ssh')

def generate_profile_config(config_file_name, aws_access_key_id, aws_secret_access_key, region):

    # Connec to EC2; this assumes your boto config is in ~/.
    ec2Connection = boto.ec2.connect_to_region(
        region_name = region,
        aws_access_key_id  = aws_access_key_id,
        aws_secret_access_key = aws_secret_access_key)

    # Get list of reservations.
    reservationList = ec2Connection.get_all_instances()

    # Initialize instance data tuple
    instanceData = []

    try:
        # Iterate over reservations
        for reservation in reservationList:
        # Iterate over instances
            for instance in reservation.instances:
                # Check for user tag
                if 'user' in instance.tags:
                    user = instance.tags['user']
                else:
                    user = defaultUser

                # Check for name tag
                if 'Name' in instance.tags:
                    name = instance.tags['Name']
                else:
                    name = instance.id

                instanceData.append((name.replace(' ','_'), instance.ip_address, instance.key_name, defaultUser))

        # Generate .ssh/config output
        configFileName = defaultKeyPath + '/' + config_file_name + '_config'
        with open(configFileName, 'w') as f:
            print("Generating " + configFileName)
            f.write("#============ GENERATED DATA START ==================\n")
            for data in instanceData:
                f.write("Host {0}\n".format(data[0]))
                f.write("    HostName {0}\n".format(data[1]))
                f.write("    User {0}\n".format(data[3]))
                f.write("    IdentityFile {0}\n".format(os.path.join(defaultKeyPath, "{0}.pem".format(data[2]))))
                f.write("    ControlPath ~/.ssh/ec2-{0}:%p.%r\n".format(data[0]))
                f.write("\n")

            f.write("#============ GENERATED DATA END ==================\n")
    except Error as inst:
        print(dir(inst))
        print "Error..." + inst.message
def main():
    '''
    Main method.
    '''

    config = ConfigParser.ConfigParser()
    config.readfp(open(userHome + '/.aws/config'))

    for section in config.sections():
        aws_access_key_id  = config.get(section, 'aws_access_key_id')
        aws_secret_access_key = config.get(section, 'aws_secret_access_key')
        region = config.get(section, 'region')
        profile_name = re.sub('^profile ', '', section)
        generate_profile_config(profile_name,
                                aws_access_key_id,
                                aws_secret_access_key,
                                region)

if __name__ == "__main__":
    main()
