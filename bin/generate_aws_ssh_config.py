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
defaultRegion = 'eu-west-1'

# Default key path
userHome = expanduser("~")
defaultKeyPath = os.path.join(userHome, '.ssh')


def generate_profile_config(region_name, profile_name):

    ec2 = boto.ec2.connect_to_region(region_name=region_name,
                                     profile_name=profile_name)

    # Get list of reservations.
    reservationList = ec2.get_all_instances()

    # Initialize instance data tuple
    instanceData = []

    try:
        # Iterate over reservations
        for reservation in reservationList:
            # Iterate over instances
            for instance in reservation.instances:
                user = instance.tags.get('User', defaultUser)
                name = instance.tags.get('Name', instance.id)

                if instance.ip_address:
                    instanceData.append((name.replace(' ', '_'),
                                         instance.ip_address,
                                         instance.key_name, user))
                    if 'MC Containers' in instance.tags:
                        containers = instance.tags['MC Containers'].split()
                        for container in containers:
                            instanceData.append((container.replace(' ', '_'),
                                                 instance.ip_address,
                                                 instance.key_name, user))

        # Generate .ssh/config output
        config_file_name = defaultKeyPath + '/' + profile_name + '_config'
        with open(config_file_name, 'w') as f:
            print("Generating " + config_file_name)
            f.write("#============ GENERATED DATA START ==================\n")
            f.write("UserKnownHostsFile=/dev/null\n")
            f.write("StrictHostKeyChecking=no\n\n")
            for data in instanceData:
                f.write("Host {0}\n".format(data[0]))
                f.write("    HostName {host_name}\n".format(host_name=data[1]))
                f.write("    User {user}\n".format(user=data[3]))
                f.write("    IdentityFile {identity_file}\n".format(
                    identity_file=os.path. join(defaultKeyPath,
                                                "{key_name}.pem".format(
                                                    key_name=data[2]))))
                f.write("    ControlPath ~/.ssh/ec2-{0}:%p.%r\n".format(
                    data[0]))
                f.write("\n")

            f.write("#============ GENERATED DATA END ==================\n")
    except Exception as inst:
        print(dir(inst))
        print("Error..." + inst.message)

def main():
    '''
    Main method.
    '''

    config = ConfigParser.ConfigParser()
    config.readfp(open(userHome + '/.aws/config'))

    for section in config.sections():
        profile_name = re.sub('^profile ', '', section)
        region_name = config.get(section, 'region', defaultRegion)
        generate_profile_config(region_name, profile_name)

if __name__ == "__main__":
    main()
