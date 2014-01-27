#!/usr/bin/python
'''
@author Bommarito Consulting, LLC
@date 2012-12-23

Generate .ssh/config lines from EC2 instance information.
'''

# Imports
import boto
import boto.ec2
import os

def main():
    '''
    Main method.
    '''
    
    # Default user
    defaultUser = 'ec2-user'

    # Default key path
    userHome = "~"
    defaultKeyPath = os.path.join(userHome, '.ssh')
    
    # Connec to EC2; this assumes your boto config is in ~/.
    ec2Connection = boto.ec2.connect_to_region("eu-west-1")

    # Get list of reservations.
    reservationList = ec2Connection.get_all_instances()

    # Initialize instance data tuple
    instanceData = []
    
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

            instanceData.append((name, instance.public_dns_name, instance.key_name, defaultUser))

    # Generate .ssh/config output
    print "#============ GENERATED DATA START =================="
    for data in instanceData:
        print """Host {0}
    HostName {1}
    User {2}
    IdentityFile {3}
    ControlPath ~/.ssh/ec2-{0}:%p.%r
""".format(data[0], data[1], data[3], os.path.join(defaultKeyPath, "{0}.pem".format(data[2])))
    
    print "#============ GENERATED DATA END =================="

if __name__ == "__main__":
    main()
