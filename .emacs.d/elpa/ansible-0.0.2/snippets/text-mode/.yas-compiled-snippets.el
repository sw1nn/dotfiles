;;; Compiled snippets and support files for `text-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("cloudformation" "- name: ${1:create a AWS CloudFormation stack}\n  cloudformation: stack_name=$2 state=$3 template=$4 $0\n" "create a AWS CloudFormation stack" ansible
			("cloud")
			nil nil nil nil)
		       ("digital_ocean" "- name: ${1:Create/delete a droplet/SSH_key in DigitalOcean}\n  digital_ocean: $0\n" "Create/delete a droplet/SSH_key in DigitalOcean" ansible
			("cloud")
			nil nil nil nil)
		       ("digital_ocean_domain" "- name: ${1:Create/delete a DNS record in DigitalOcean}\n  digital_ocean_domain: $0\n" "Create/delete a DNS record in DigitalOcean" ansible
			("cloud")
			nil nil nil nil)
		       ("digital_ocean_sshkey" "- name: ${1:Create/delete an SSH key in DigitalOcean}\n  digital_ocean_sshkey: $0\n" "Create/delete an SSH key in DigitalOcean" ansible
			("cloud")
			nil nil nil nil)
		       ("docker" "- name: ${1:manage docker containers}\n  docker: image=$2 $0\n" "manage docker containers" ansible
			("cloud")
			nil nil nil nil)
		       ("docker_image" "- name: ${1:manage docker images}\n  docker_image: name=$2 $0\n" "manage docker images" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2" "- name: ${1:create, terminate, start or stop an instance in ec2, return instanceid}\n  ec2: instance_type=$2 image=$3 $0\n" "create, terminate, start or stop an instance in ec2, return instanceid" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_ami" "- name: ${1:create or destroy an image in ec2, return imageid}\n  ec2_ami: $0\n" "create or destroy an image in ec2, return imageid" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_ami_search" "- name: ${1:Retrieve AWS AMI for a given operating system.}\n  ec2_ami_search: distro=$2 release=$3 $0\n" "Retrieve AWS AMI for a given operating system." ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_asg" "- name: ${1:Create or delete AWS Autoscaling Groups}\n  ec2_asg: state=$2 name=$3 $0\n" "Create or delete AWS Autoscaling Groups" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_eip" "- name: ${1:associate an EC2 elastic IP with an instance.}\n  ec2_eip: $0\n" "associate an EC2 elastic IP with an instance." ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_elb" "- name: ${1:De-registers or registers instances from EC2 ELBs}\n  ec2_elb: state=$2 instance_id=$3 $0\n" "De-registers or registers instances from EC2 ELBs" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_elb_lb" "- name: ${1:Creates or destroys Amazon ELB. - Returns information about the load balancer. - Will be marked changed when called only if state is changed.}\n  ec2_elb_lb: state=$2 name=$3 $0\n" "Creates or destroys Amazon ELB. - Returns information about the load balancer. - Will be marked changed when called only if state is changed." ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_facts" "- name: ${1:Gathers facts about remote hosts within ec2 (aws)}\n  ec2_facts: $0\n" "Gathers facts about remote hosts within ec2 (aws)" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_group" "- name: ${1:maintain an ec2 VPC security group.}\n  ec2_group: name=$2 description=$3 $0\n" "maintain an ec2 VPC security group." ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_key" "- name: ${1:maintain an ec2 key pair.}\n  ec2_key: name=$2 $0\n" "maintain an ec2 key pair." ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_lc" "- name: ${1:Create or delete AWS Autoscaling Launch Configurations}\n  ec2_lc: state=$2 name=$3 instance_type=$4 $0\n" "Create or delete AWS Autoscaling Launch Configurations" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_metric_alarm" "- name: ${1:Create/update or delete AWS Cloudwatch 'metric alarms'}\n  ec2_metric_alarm: state=$2 name=$3 $0\n" "Create/update or delete AWS Cloudwatch 'metric alarms'" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_scaling_policy" "- name: ${1:Create or delete AWS scaling policies for Autoscaling groups}\n  ec2_scaling_policy: state=$2 name=$3 asg_name=$4 $0\n" "Create or delete AWS scaling policies for Autoscaling groups" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_snapshot" "- name: ${1:creates a snapshot from an existing volume}\n  ec2_snapshot: $0\n" "creates a snapshot from an existing volume" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_tag" "- name: ${1:create and remove tag(s) to ec2 resources.}\n  ec2_tag: resource=$2 $0\n" "create and remove tag(s) to ec2 resources." ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_vol" "- name: ${1:create and attach a volume, return volume id and device map}\n  ec2_vol: $0\n" "create and attach a volume, return volume id and device map" ansible
			("cloud")
			nil nil nil nil)
		       ("ec2_vpc" "- name: ${1:configure AWS virtual private clouds}\n  ec2_vpc: cidr_block=$2 state=${3:present} $0\n" "configure AWS virtual private clouds" ansible
			("cloud")
			nil nil nil nil)
		       ("elasticache" "- name: ${1:Manage cache clusters in Amazon Elasticache.}\n  elasticache: state=$2 name=$3 $0\n" "Manage cache clusters in Amazon Elasticache." ansible
			("cloud")
			nil nil nil nil)
		       ("gc_storage" "- name: ${1:This module manages objects/buckets in Google Cloud Storage.}\n  gc_storage: bucket=$2 mode=$3 gcs_secret_key=$4 gcs_access_key=$5 $0\n" "This module manages objects/buckets in Google Cloud Storage." ansible
			("cloud")
			nil nil nil nil)
		       ("gce" "- name: ${1:create or terminate GCE instances}\n  gce: zone=${2:us-central1-a} $0\n" "create or terminate GCE instances" ansible
			("cloud")
			nil nil nil nil)
		       ("gce_lb" "- name: ${1:create/destroy GCE load-balancer resources}\n  gce_lb: $0\n" "create/destroy GCE load-balancer resources" ansible
			("cloud")
			nil nil nil nil)
		       ("gce_net" "- name: ${1:create/destroy GCE networks and firewall rules}\n  gce_net: $0\n" "create/destroy GCE networks and firewall rules" ansible
			("cloud")
			nil nil nil nil)
		       ("gce_pd" "- name: ${1:utilize GCE persistent disk resources}\n  gce_pd: name=$2 $0\n" "utilize GCE persistent disk resources" ansible
			("cloud")
			nil nil nil nil)
		       ("glance_image" "- name: ${1:Add/Delete images from glance}\n  glance_image: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} name=${5:None} $0\n" "Add/Delete images from glance" ansible
			("cloud")
			nil nil nil nil)
		       ("keystone_user" "- name: ${1:Manage OpenStack Identity (keystone) users, tenants and roles}\n  keystone_user: $0\n" "Manage OpenStack Identity (keystone) users, tenants and roles" ansible
			("cloud")
			nil nil nil nil)
		       ("linode" "- name: ${1:create / delete / stop / restart an instance in Linode Public Cloud}\n  linode: $0\n" "create / delete / stop / restart an instance in Linode Public Cloud" ansible
			("cloud")
			nil nil nil nil)
		       ("nova_compute" "- name: ${1:Create/Delete VMs from OpenStack}\n  nova_compute: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} name=${5:None} image_id=${6:None} $0\n" "Create/Delete VMs from OpenStack" ansible
			("cloud")
			nil nil nil nil)
		       ("nova_keypair" "- name: ${1:Add/Delete key pair from nova}\n  nova_keypair: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} name=${5:None} $0\n" "Add/Delete key pair from nova" ansible
			("cloud")
			nil nil nil nil)
		       ("ovirt" "- name: ${1:oVirt/RHEV platform management}\n  ovirt: user=$2 url=$3 instance_name=$4 password=$5 $0\n" "oVirt/RHEV platform management" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_floating_ip" "- name: ${1:Add/Remove floating IP from an instance}\n  quantum_floating_ip: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} network_name=${5:None} instance_name=${6:None} $0\n" "Add/Remove floating IP from an instance" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_floating_ip_associate" "- name: ${1:Associate or disassociate a particular floating IP with an instance}\n  quantum_floating_ip_associate: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:true} instance_name=${5:None} ip_address=${6:None} $0\n" "Associate or disassociate a particular floating IP with an instance" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_network" "- name: ${1:Creates/Removes networks from OpenStack}\n  quantum_network: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} name=${5:None} $0\n" "Creates/Removes networks from OpenStack" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_router" "- name: ${1:Create or Remove router from openstack}\n  quantum_router: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} name=${5:None} $0\n" "Create or Remove router from openstack" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_router_gateway" "- name: ${1:set/unset a gateway interface for the router with the specified external network}\n  quantum_router_gateway: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} router_name=${5:None} network_name=${6:None} $0\n" "set/unset a gateway interface for the router with the specified external network" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_router_interface" "- name: ${1:Attach/Dettach a subnet's interface to a router}\n  quantum_router_interface: login_username=${2:admin} login_password=${3:yes} login_tenant_name=${4:yes} router_name=${5:None} subnet_name=${6:None} $0\n" "Attach/Dettach a subnet's interface to a router" ansible
			("cloud")
			nil nil nil nil)
		       ("quantum_subnet" "- name: ${1:Add/Remove floating IP from an instance}\n  quantum_subnet: login_username=${2:admin} login_password=${3:true} login_tenant_name=${4:true} network_name=${5:None} name=${6:None} cidr=${7:None} $0\n" "Add/Remove floating IP from an instance" ansible
			("cloud")
			nil nil nil nil)
		       ("rax" "- name: ${1:create / delete an instance in Rackspace Public Cloud}\n  rax: $0\n" "create / delete an instance in Rackspace Public Cloud" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_cbs" "- name: ${1:Manipulate Rackspace Cloud Block Storage Volumes}\n  rax_cbs: name=$2 size=${3:100} state=${4:present} volume_type=${5:SATA} $0\n" "Manipulate Rackspace Cloud Block Storage Volumes" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_cbs_attachments" "- name: ${1:Manipulate Rackspace Cloud Block Storage Volume Attachments}\n  rax_cbs_attachments: device=$2 volume=$3 server=$4 state=${5:present} $0\n" "Manipulate Rackspace Cloud Block Storage Volume Attachments" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_clb" "- name: ${1:create / delete a load balancer in Rackspace Public Cloud}\n  rax_clb: $0\n" "create / delete a load balancer in Rackspace Public Cloud" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_clb_nodes" "- name: ${1:add, modify and remove nodes from a Rackspace Cloud Load Balancer}\n  rax_clb_nodes: load_balancer_id=$2 $0\n" "add, modify and remove nodes from a Rackspace Cloud Load Balancer" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_dns" "- name: ${1:Manage domains on Rackspace Cloud DNS}\n  rax_dns: $0\n" "Manage domains on Rackspace Cloud DNS" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_dns_record" "- name: ${1:Manage DNS records on Rackspace Cloud DNS}\n  rax_dns_record: data=$2 domain=$3 name=$4 $0\n" "Manage DNS records on Rackspace Cloud DNS" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_facts" "- name: ${1:Gather facts for Rackspace Cloud Servers}\n  rax_facts: $0\n" "Gather facts for Rackspace Cloud Servers" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_files" "- name: ${1:Manipulate Rackspace Cloud Files Containers}\n  rax_files: container=$2 $0\n" "Manipulate Rackspace Cloud Files Containers" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_files_objects" "- name: ${1:Upload, download, and delete objects in Rackspace Cloud Files}\n  rax_files_objects: container=$2 $0\n" "Upload, download, and delete objects in Rackspace Cloud Files" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_identity" "- name: ${1:Load Rackspace Cloud Identity}\n  rax_identity: $0\n" "Load Rackspace Cloud Identity" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_keypair" "- name: ${1:Create a keypair for use with Rackspace Cloud Servers}\n  rax_keypair: name=$2 $0\n" "Create a keypair for use with Rackspace Cloud Servers" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_network" "- name: ${1:create / delete an isolated network in Rackspace Public Cloud}\n  rax_network: $0\n" "create / delete an isolated network in Rackspace Public Cloud" ansible
			("cloud")
			nil nil nil nil)
		       ("rax_queue" "- name: ${1:create / delete a queue in Rackspace Public Cloud}\n  rax_queue: $0\n" "create / delete a queue in Rackspace Public Cloud" ansible
			("cloud")
			nil nil nil nil)
		       ("rds" "- name: ${1:create, delete, or modify an Amazon rds instance}\n  rds: command=$2 instance_name=$3 region=$4 $0\n" "create, delete, or modify an Amazon rds instance" ansible
			("cloud")
			nil nil nil nil)
		       ("rds_param_group" "- name: ${1:manage RDS parameter groups}\n  rds_param_group: state=${2:present} name=$3 region=$4 $0\n" "manage RDS parameter groups" ansible
			("cloud")
			nil nil nil nil)
		       ("rds_subnet_group" "- name: ${1:manage RDS database subnet groups}\n  rds_subnet_group: state=${2:present} name=$3 region=$4 $0\n" "manage RDS database subnet groups" ansible
			("cloud")
			nil nil nil nil)
		       ("route53" "- name: ${1:add or delete entries in Amazons Route53 DNS service}\n  route53: command=$2 zone=$3 record=$4 type=$5 $0\n" "add or delete entries in Amazons Route53 DNS service" ansible
			("cloud")
			nil nil nil nil)
		       ("s3" "- name: ${1:idempotent S3 module putting a file into S3.}\n  s3: bucket=$2 mode=$3 $0\n" "idempotent S3 module putting a file into S3." ansible
			("cloud")
			nil nil nil nil)
		       ("virt" "- name: ${1:Manages virtual machines supported by libvirt}\n  virt: name=$2 $0\n" "Manages virtual machines supported by libvirt" ansible
			("cloud")
			nil nil nil nil)
		       ("vsphere_guest" "- name: ${1:Create/delete/manage a guest VM through VMware vSphere.}\n  vsphere_guest: vcenter_hostname=$2 guest=$3 user=$4 password=$5 $0\n" "Create/delete/manage a guest VM through VMware vSphere." ansible
			("cloud")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("command" "- name: ${1:Executes a command on a remote node}\n  command: free_form=$2 $0\n" "Executes a command on a remote node" ansible
			("commands")
			nil nil nil nil)
		       ("raw" "- name: ${1:Executes a low-down and dirty SSH command}\n  raw: free_form=$2 $0\n" "Executes a low-down and dirty SSH command" ansible
			("commands")
			nil nil nil nil)
		       ("script" "- name: ${1:Runs a local script on a remote node after transferring it}\n  script: free_form=$2 $0\n" "Runs a local script on a remote node after transferring it" ansible
			("commands")
			nil nil nil nil)
		       ("shell" "- name: ${1:Execute commands in nodes.}\n  shell: free_form=$2 $0\n" "Execute commands in nodes." ansible
			("commands")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("mongodb_user" "- name: ${1:Adds or removes a user from a MongoDB database.}\n  mongodb_user: database=$2 user=$3 $0\n" "Adds or removes a user from a MongoDB database." ansible
			("database")
			nil nil nil nil)
		       ("mysql_db" "- name: ${1:Add or remove MySQL databases from a remote host.}\n  mysql_db: name=$2 $0\n" "Add or remove MySQL databases from a remote host." ansible
			("database")
			nil nil nil nil)
		       ("mysql_replication" "- name: ${1:Manage MySQL replication}\n  mysql_replication: $0\n" "Manage MySQL replication" ansible
			("database")
			nil nil nil nil)
		       ("mysql_user" "- name: ${1:Adds or removes a user from a MySQL database.}\n  mysql_user: name=$2 $0\n" "Adds or removes a user from a MySQL database." ansible
			("database")
			nil nil nil nil)
		       ("mysql_variables" "- name: ${1:Manage MySQL global variables}\n  mysql_variables: variable=$2 $0\n" "Manage MySQL global variables" ansible
			("database")
			nil nil nil nil)
		       ("postgresql_db" "- name: ${1:Add or remove PostgreSQL databases from a remote host.}\n  postgresql_db: name=$2 $0\n" "Add or remove PostgreSQL databases from a remote host." ansible
			("database")
			nil nil nil nil)
		       ("postgresql_privs" "- name: ${1:Grant or revoke privileges on PostgreSQL database objects.}\n  postgresql_privs: database=$2 roles=$3 $0\n" "Grant or revoke privileges on PostgreSQL database objects." ansible
			("database")
			nil nil nil nil)
		       ("postgresql_user" "- name: ${1:Adds or removes a users (roles) from a PostgreSQL database.}\n  postgresql_user: name=$2 $0\n" "Adds or removes a users (roles) from a PostgreSQL database." ansible
			("database")
			nil nil nil nil)
		       ("redis" "- name: ${1:Various redis commands, slave and flush}\n  redis: command=$2 $0\n" "Various redis commands, slave and flush" ansible
			("database")
			nil nil nil nil)
		       ("riak" "- name: ${1:This module handles some common Riak operations}\n  riak: $0\n" "This module handles some common Riak operations" ansible
			("database")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("acl" "- name: ${1:Sets and retrieves file ACL information.}\n  acl: name=$2 $0\n" "Sets and retrieves file ACL information." ansible
			("files")
			nil nil nil nil)
		       ("assemble" "- name: ${1:Assembles a configuration file from fragments}\n  assemble: src=$2 dest=$3 $0\n" "Assembles a configuration file from fragments" ansible
			("files")
			nil nil nil nil)
		       ("copy" "- name: ${1:Copies files to remote locations.}\n  copy: dest=$2 $0\n" "Copies files to remote locations." ansible
			("files")
			nil nil nil nil)
		       ("fetch" "- name: ${1:Fetches a file from remote nodes}\n  fetch: src=$2 dest=$3 $0\n" "Fetches a file from remote nodes" ansible
			("files")
			nil nil nil nil)
		       ("file" "- name: ${1:Sets attributes of files}\n  file: $2 $0\n" "Sets attributes of files" ansible
			("files")
			nil nil nil nil)
		       ("ini_file" "- name: ${1:Tweak settings in INI files}\n  ini_file: dest=$2 section=$3 $0\n" "Tweak settings in INI files" ansible
			("files")
			nil nil nil nil)
		       ("lineinfile" "- name: ${1:Ensure a particular line is in a file, or replace an existing line using a back-referenced regular expression.}\n  lineinfile: dest=$2 $0\n" "Ensure a particular line is in a file, or replace an existing line using a back-referenced regular expression." ansible
			("files")
			nil nil nil nil)
		       ("replace" "- name: ${1:Replace all instances of a particular string in a file using a back-referenced regular expression.}\n  replace: dest=$2 regexp=$3 $0\n" "Replace all instances of a particular string in a file using a back-referenced regular expression." ansible
			("files")
			nil nil nil nil)
		       ("stat" "- name: ${1:retrieve file or file system status}\n  stat: path=$2 $0\n" "retrieve file or file system status" ansible
			("files")
			nil nil nil nil)
		       ("synchronize" "- name: ${1:Uses rsync to make synchronizing file paths in your playbooks quick and easy.}\n  synchronize: src=$2 dest=$3 $0\n" "Uses rsync to make synchronizing file paths in your playbooks quick and easy." ansible
			("files")
			nil nil nil nil)
		       ("template" "- name: ${1:Templates a file out to a remote server.}\n  template: src=$2 dest=$3 $0\n" "Templates a file out to a remote server." ansible
			("files")
			nil nil nil nil)
		       ("unarchive" "- name: ${1:Copies an archive to a remote location and unpack it}\n  unarchive: src=$2 dest=$3 $0\n" "Copies an archive to a remote location and unpack it" ansible
			("files")
			nil nil nil nil)
		       ("xattr" "- name: ${1:set/retrieve extended attributes}\n  xattr: name=${2:None} $0\n" "set/retrieve extended attributes" ansible
			("files")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("async_status" "- name: ${1:Obtain status of asynchronous task}\n  async_status: jid=$2 $0\n" "Obtain status of asynchronous task" ansible
			("internal")
			nil nil nil nil)
		       ("async_wrapper" "" "async_wrapper" nil
			("internal")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("add_host" "- name: ${1:add a host (and alternatively a group) to the ansible-playbook in-memory inventory}\n  add_host: name=$2 $0\n" "add a host (and alternatively a group) to the ansible-playbook in-memory inventory" ansible
			("inventory")
			nil nil nil nil)
		       ("group_by" "- name: ${1:Create Ansible groups based on facts}\n  group_by: key=$2 $0\n" "Create Ansible groups based on facts" ansible
			("inventory")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("rabbitmq_parameter" "- name: ${1:Adds or removes parameters to RabbitMQ}\n  rabbitmq_parameter: component=$2 name=$3 $0\n" "Adds or removes parameters to RabbitMQ" ansible
			("messaging")
			nil nil nil nil)
		       ("rabbitmq_plugin" "- name: ${1:Adds or removes plugins to RabbitMQ}\n  rabbitmq_plugin: names=$2 $0\n" "Adds or removes plugins to RabbitMQ" ansible
			("messaging")
			nil nil nil nil)
		       ("rabbitmq_policy" "- name: ${1:Manage the state of policies in RabbitMQ.}\n  rabbitmq_policy: name=$2 pattern=$3 tags=$4 $0\n" "Manage the state of policies in RabbitMQ." ansible
			("messaging")
			nil nil nil nil)
		       ("rabbitmq_user" "- name: ${1:Adds or removes users to RabbitMQ}\n  rabbitmq_user: user=$2 $0\n" "Adds or removes users to RabbitMQ" ansible
			("messaging")
			nil nil nil nil)
		       ("rabbitmq_vhost" "- name: ${1:Manage the state of a virtual host in RabbitMQ}\n  rabbitmq_vhost: name=$2 $0\n" "Manage the state of a virtual host in RabbitMQ" ansible
			("messaging")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("airbrake_deployment" "- name: ${1:Notify airbrake about app deployments}\n  airbrake_deployment: token=$2 environment=$3 $0\n" "Notify airbrake about app deployments" ansible
			("monitoring")
			nil nil nil nil)
		       ("boundary_meter" "- name: ${1:Manage boundary meters}\n  boundary_meter: name=$2 apiid=$3 apikey=$4 $0\n" "Manage boundary meters" ansible
			("monitoring")
			nil nil nil nil)
		       ("datadog_event" "- name: ${1:Posts events to DataDog  service}\n  datadog_event: api_key=$2 title=$3 text=$4 $0\n" "Posts events to DataDog  service" ansible
			("monitoring")
			nil nil nil nil)
		       ("librato_annotation" "- name: ${1:create an annotation in librato}\n  librato_annotation: user=$2 api_key=$3 title=$4 links=$5 $0\n" "create an annotation in librato" ansible
			("monitoring")
			nil nil nil nil)
		       ("logentries" "- name: ${1:Module for tracking logs via logentries.com}\n  logentries: path=$2 $0\n" "Module for tracking logs via logentries.com" ansible
			("monitoring")
			nil nil nil nil)
		       ("monit" "- name: ${1:Manage the state of a program monitored via Monit}\n  monit: name=$2 state=$3 $0\n" "Manage the state of a program monitored via Monit" ansible
			("monitoring")
			nil nil nil nil)
		       ("nagios" "- name: ${1:Perform common tasks in Nagios related to downtime and notifications.}\n  nagios: action=$2 services=$3 command=$4 $0\n" "Perform common tasks in Nagios related to downtime and notifications." ansible
			("monitoring")
			nil nil nil nil)
		       ("newrelic_deployment" "- name: ${1:Notify newrelic about app deployments}\n  newrelic_deployment: token=$2 $0\n" "Notify newrelic about app deployments" ansible
			("monitoring")
			nil nil nil nil)
		       ("pagerduty" "- name: ${1:Create PagerDuty maintenance windows}\n  pagerduty: state=$2 name=$3 user=$4 passwd=$5 $0\n" "Create PagerDuty maintenance windows" ansible
			("monitoring")
			nil nil nil nil)
		       ("pingdom" "- name: ${1:Pause/unpause Pingdom alerts}\n  pingdom: state=$2 checkid=$3 uid=$4 passwd=$5 key=$6 $0\n" "Pause/unpause Pingdom alerts" ansible
			("monitoring")
			nil nil nil nil)
		       ("rollbar_deployment" "- name: ${1:Notify Rollbar about app deployments}\n  rollbar_deployment: token=$2 environment=$3 revision=$4 $0\n" "Notify Rollbar about app deployments" ansible
			("monitoring")
			nil nil nil nil)
		       ("stackdriver" "- name: ${1:Send code deploy and annotation events to stackdriver}\n  stackdriver: key=$2 $0\n" "Send code deploy and annotation events to stackdriver" ansible
			("monitoring")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("arista_interface" "- name: ${1:Manage physical Ethernet interfaces}\n  arista_interface: interface_id=$2 $0\n" "Manage physical Ethernet interfaces" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("arista_l2interface" "- name: ${1:Manage layer 2 interfaces}\n  arista_l2interface: interface_id=$2 $0\n" "Manage layer 2 interfaces" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("arista_lag" "- name: ${1:Manage port channel (lag) interfaces}\n  arista_lag: interface_id=$2 $0\n" "Manage port channel (lag) interfaces" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("arista_vlan" "- name: ${1:Manage VLAN resources}\n  arista_vlan: vlan_id=$2 $0\n" "Manage VLAN resources" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("bigip_facts" "- name: ${1:Collect facts from F5 BIG-IP devices}\n  bigip_facts: server=$2 user=$3 password=$4 include=$5 $0\n" "Collect facts from F5 BIG-IP devices" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("bigip_monitor_http" "- name: ${1:Manages F5 BIG-IP LTM http monitors}\n  bigip_monitor_http: server=$2 user=$3 password=$4 name=$5 send=${6:none} receive=${7:none} receive_disable=${8:none} $0\n" "Manages F5 BIG-IP LTM http monitors" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("bigip_monitor_tcp" "- name: ${1:Manages F5 BIG-IP LTM tcp monitors}\n  bigip_monitor_tcp: server=$2 user=$3 password=$4 name=$5 send=${6:none} receive=${7:none} $0\n" "Manages F5 BIG-IP LTM tcp monitors" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("bigip_node" "- name: ${1:Manages F5 BIG-IP LTM nodes}\n  bigip_node: server=$2 user=$3 password=$4 state=${5:present} host=$6 $0\n" "Manages F5 BIG-IP LTM nodes" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("bigip_pool" "- name: ${1:Manages F5 BIG-IP LTM pools}\n  bigip_pool: server=$2 user=$3 password=$4 name=$5 $0\n" "Manages F5 BIG-IP LTM pools" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("bigip_pool_member" "- name: ${1:Manages F5 BIG-IP LTM pool members}\n  bigip_pool_member: server=$2 user=$3 password=$4 state=${5:present} pool=$6 host=$7 port=$8 $0\n" "Manages F5 BIG-IP LTM pool members" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("dnsimple" "- name: ${1:Interface with dnsimple.com (a DNS hosting service).}\n  dnsimple: $0\n" "Interface with dnsimple.com (a DNS hosting service)." ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("dnsmadeeasy" "- name: ${1:Interface with dnsmadeeasy.com (a DNS hosting service).}\n  dnsmadeeasy: account_key=$2 account_secret=$3 domain=$4 state=$5 $0\n" "Interface with dnsmadeeasy.com (a DNS hosting service)." ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("lldp" "- name: ${1:get details reported by lldp}\n  lldp: $0\n" "get details reported by lldp" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("netscaler" "- name: ${1:Manages Citrix NetScaler entities}\n  netscaler: nsc_host=$2 user=$3 password=$4 name=${5:hostname} $0\n" "Manages Citrix NetScaler entities" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("openvswitch_bridge" "- name: ${1:Manage Open vSwitch bridges}\n  openvswitch_bridge: bridge=$2 $0\n" "Manage Open vSwitch bridges" ansible
			("net_infrastructure")
			nil nil nil nil)
		       ("openvswitch_port" "- name: ${1:Manage Open vSwitch ports}\n  openvswitch_port: bridge=$2 port=$3 $0\n" "Manage Open vSwitch ports" ansible
			("net_infrastructure")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("get_url" "- name: ${1:Downloads files from HTTP, HTTPS, or FTP to node}\n  get_url: url=$2 dest=$3 $0\n" "Downloads files from HTTP, HTTPS, or FTP to node" ansible
			("network")
			nil nil nil nil)
		       ("slurp" "- name: ${1:Slurps a file from remote nodes}\n  slurp: src=$2 $0\n" "Slurps a file from remote nodes" ansible
			("network")
			nil nil nil nil)
		       ("uri" "- name: ${1:Interacts with webservices}\n  uri: url=$2 $0\n" "Interacts with webservices" ansible
			("network")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("campfire" "- name: ${1:Send a message to Campfire}\n  campfire: subscription=$2 token=$3 room=$4 msg=$5 $0\n" "Send a message to Campfire" ansible
			("notification")
			nil nil nil nil)
		       ("flowdock" "- name: ${1:Send a message to a flowdock}\n  flowdock: token=$2 type=$3 msg=$4 $0\n" "Send a message to a flowdock" ansible
			("notification")
			nil nil nil nil)
		       ("grove" "- name: ${1:Sends a notification to a grove.io channel}\n  grove: channel_token=$2 message=$3 $0\n" "Sends a notification to a grove.io channel" ansible
			("notification")
			nil nil nil nil)
		       ("hipchat" "- name: ${1:Send a message to hipchat}\n  hipchat: token=$2 room=$3 msg=$4 $0\n" "Send a message to hipchat" ansible
			("notification")
			nil nil nil nil)
		       ("irc" "- name: ${1:Send a message to an IRC channel}\n  irc: msg=$2 channel=$3 $0\n" "Send a message to an IRC channel" ansible
			("notification")
			nil nil nil nil)
		       ("jabber" "- name: ${1:Send a message to jabber user or chat room}\n  jabber: user=$2 password=$3 to=$4 msg=$5 $0\n" "Send a message to jabber user or chat room" ansible
			("notification")
			nil nil nil nil)
		       ("mail" "- name: ${1:Send an email}\n  mail: subject=$2 $0\n" "Send an email" ansible
			("notification")
			nil nil nil nil)
		       ("mqtt" "- name: ${1:Publish a message on an MQTT topic for the IoT}\n  mqtt: topic=$2 payload=$3 $0\n" "Publish a message on an MQTT topic for the IoT" ansible
			("notification")
			nil nil nil nil)
		       ("nexmo" "- name: ${1:Send a SMS via nexmo}\n  nexmo: api_key=$2 api_secret=$3 src=$4 dest=$5 msg=$6 $0\n" "Send a SMS via nexmo" ansible
			("notification")
			nil nil nil nil)
		       ("osx_say" "- name: ${1:Makes an OSX computer to speak.}\n  osx_say: msg=$2 $0\n" "Makes an OSX computer to speak." ansible
			("notification")
			nil nil nil nil)
		       ("slack" "- name: ${1:Send Slack notifications}\n  slack: domain=$2 token=$3 msg=$4 $0\n" "Send Slack notifications" ansible
			("notification")
			nil nil nil nil)
		       ("sns" "- name: ${1:Send Amazon Simple Notification Service (SNS) messages}\n  sns: msg=$2 topic=$3 $0\n" "Send Amazon Simple Notification Service (SNS) messages" ansible
			("notification")
			nil nil nil nil)
		       ("twilio" "- name: ${1:Sends a text message to a mobile phone through Twilio.}\n  twilio: account_sid=$2 auth_token=$3 msg=$4 to_number=$5 from_number=$6 $0\n" "Sends a text message to a mobile phone through Twilio." ansible
			("notification")
			nil nil nil nil)
		       ("typetalk" "- name: ${1:Send a message to typetalk}\n  typetalk: client_id=$2 client_secret=$3 topic=$4 msg=$5 $0\n" "Send a message to typetalk" ansible
			("notification")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("apt" "- name: ${1:Manages apt-packages}\n  apt: $0\n" "Manages apt-packages" ansible
			("packaging")
			nil nil nil nil)
		       ("apt_key" "- name: ${1:Add or remove an apt key}\n  apt_key: $0\n" "Add or remove an apt key" ansible
			("packaging")
			nil nil nil nil)
		       ("apt_repository" "- name: ${1:Add and remove APT repositores}\n  apt_repository: repo=${2:none} $0\n" "Add and remove APT repositores" ansible
			("packaging")
			nil nil nil nil)
		       ("apt_rpm" "- name: ${1:apt_rpm package manager}\n  apt_rpm: pkg=$2 $0\n" "apt_rpm package manager" ansible
			("packaging")
			nil nil nil nil)
		       ("composer" "- name: ${1:Dependency Manager for PHP}\n  composer: working_dir=$2 $0\n" "Dependency Manager for PHP" ansible
			("packaging")
			nil nil nil nil)
		       ("cpanm" "- name: ${1:Manages Perl library dependencies.}\n  cpanm: $0\n" "Manages Perl library dependencies." ansible
			("packaging")
			nil nil nil nil)
		       ("easy_install" "- name: ${1:Installs Python libraries}\n  easy_install: name=$2 $0\n" "Installs Python libraries" ansible
			("packaging")
			nil nil nil nil)
		       ("gem" "- name: ${1:Manage Ruby gems}\n  gem: name=$2 $0\n" "Manage Ruby gems" ansible
			("packaging")
			nil nil nil nil)
		       ("homebrew" "- name: ${1:Package manager for Homebrew}\n  homebrew: name=$2 $0\n" "Package manager for Homebrew" ansible
			("packaging")
			nil nil nil nil)
		       ("homebrew_cask" "- name: ${1:Install/uninstall homebrew casks.}\n  homebrew_cask: name=$2 $0\n" "Install/uninstall homebrew casks." ansible
			("packaging")
			nil nil nil nil)
		       ("homebrew_tap" "- name: ${1:Tap a Homebrew repository.}\n  homebrew_tap: tap=$2 $0\n" "Tap a Homebrew repository." ansible
			("packaging")
			nil nil nil nil)
		       ("layman" "- name: ${1:Manage Gentoo overlays}\n  layman: name=$2 $0\n" "Manage Gentoo overlays" ansible
			("packaging")
			nil nil nil nil)
		       ("macports" "- name: ${1:Package manager for MacPorts}\n  macports: name=$2 $0\n" "Package manager for MacPorts" ansible
			("packaging")
			nil nil nil nil)
		       ("npm" "- name: ${1:Manage node.js packages with npm}\n  npm: $0\n" "Manage node.js packages with npm" ansible
			("packaging")
			nil nil nil nil)
		       ("openbsd_pkg" "- name: ${1:Manage packages on OpenBSD.}\n  openbsd_pkg: name=$2 state=$3 $0\n" "Manage packages on OpenBSD." ansible
			("packaging")
			nil nil nil nil)
		       ("opkg" "- name: ${1:Package manager for OpenWrt}\n  opkg: name=$2 $0\n" "Package manager for OpenWrt" ansible
			("packaging")
			nil nil nil nil)
		       ("pacman" "- name: ${1:Manage packages with I(pacman)}\n  pacman: $0\n" "Manage packages with I(pacman)" ansible
			("packaging")
			nil nil nil nil)
		       ("pip" "- name: ${1:Manages Python library dependencies.}\n  pip: $0\n" "Manages Python library dependencies." ansible
			("packaging")
			nil nil nil nil)
		       ("pkgin" "- name: ${1:Package manager for SmartOS}\n  pkgin: name=$2 $0\n" "Package manager for SmartOS" ansible
			("packaging")
			nil nil nil nil)
		       ("pkgng" "- name: ${1:Package manager for FreeBSD >= 9.0}\n  pkgng: name=$2 $0\n" "Package manager for FreeBSD >= 9.0" ansible
			("packaging")
			nil nil nil nil)
		       ("pkgutil" "- name: ${1:Manage CSW-Packages on Solaris}\n  pkgutil: name=$2 state=$3 $0\n" "Manage CSW-Packages on Solaris" ansible
			("packaging")
			nil nil nil nil)
		       ("portage" "- name: ${1:Package manager for Gentoo}\n  portage: $0\n" "Package manager for Gentoo" ansible
			("packaging")
			nil nil nil nil)
		       ("portinstall" "- name: ${1:Installing packages from FreeBSD's ports system}\n  portinstall: name=$2 $0\n" "Installing packages from FreeBSD's ports system" ansible
			("packaging")
			nil nil nil nil)
		       ("redhat_subscription" "- name: ${1:Manage Red Hat Network registration and subscriptions using the C(subscription-manager) command}\n  redhat_subscription: $0\n" "Manage Red Hat Network registration and subscriptions using the C(subscription-manager) command" ansible
			("packaging")
			nil nil nil nil)
		       ("rhn_channel" "- name: ${1:Adds or removes Red Hat software channels}\n  rhn_channel: name=$2 sysname=$3 url=$4 user=$5 password=$6 $0\n" "Adds or removes Red Hat software channels" ansible
			("packaging")
			nil nil nil nil)
		       ("rhn_register" "- name: ${1:Manage Red Hat Network registration using the C(rhnreg_ks) command}\n  rhn_register: $0\n" "Manage Red Hat Network registration using the C(rhnreg_ks) command" ansible
			("packaging")
			nil nil nil nil)
		       ("rpm_key" "- name: ${1:Adds or removes a gpg key from the rpm db}\n  rpm_key: key=$2 $0\n" "Adds or removes a gpg key from the rpm db" ansible
			("packaging")
			nil nil nil nil)
		       ("svr4pkg" "- name: ${1:Manage Solaris SVR4 packages}\n  svr4pkg: name=$2 state=$3 $0\n" "Manage Solaris SVR4 packages" ansible
			("packaging")
			nil nil nil nil)
		       ("swdepot" "- name: ${1:Manage packages with swdepot package manager (HP-UX)}\n  swdepot: name=$2 state=$3 $0\n" "Manage packages with swdepot package manager (HP-UX)" ansible
			("packaging")
			nil nil nil nil)
		       ("urpmi" "- name: ${1:Urpmi manager}\n  urpmi: pkg=$2 $0\n" "Urpmi manager" ansible
			("packaging")
			nil nil nil nil)
		       ("yum" "- name: ${1:Manages packages with the I(yum) package manager}\n  yum: name=$2 $0\n" "Manages packages with the I(yum) package manager" ansible
			("packaging")
			nil nil nil nil)
		       ("zypper" "- name: ${1:Manage packages on SuSE and openSuSE}\n  zypper: name=$2 $0\n" "Manage packages on SuSE and openSuSE" ansible
			("packaging")
			nil nil nil nil)
		       ("zypper_repository" "- name: ${1:Add and remove Zypper repositories}\n  zypper_repository: name=${2:none} repo=${3:none} $0\n" "Add and remove Zypper repositories" ansible
			("packaging")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("bzr" "- name: ${1:Deploy software (or files) from bzr branches}\n  bzr: name=$2 dest=$3 $0\n" "Deploy software (or files) from bzr branches" ansible
			("source_control")
			nil nil nil nil)
		       ("git" "- name: ${1:Deploy software (or files) from git checkouts}\n  git: repo=$2 dest=$3 $0\n" "Deploy software (or files) from git checkouts" ansible
			("source_control")
			nil nil nil nil)
		       ("github_hooks" "- name: ${1:Manages github service hooks.}\n  github_hooks: user=$2 oauthkey=$3 repo=$4 action=$5 $0\n" "Manages github service hooks." ansible
			("source_control")
			nil nil nil nil)
		       ("hg" "- name: ${1:Manages Mercurial (hg) repositories.}\n  hg: repo=$2 dest=$3 $0\n" "Manages Mercurial (hg) repositories." ansible
			("source_control")
			nil nil nil nil)
		       ("subversion" "- name: ${1:Deploys a subversion repository.}\n  subversion: repo=$2 dest=$3 $0\n" "Deploys a subversion repository." ansible
			("source_control")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("alternatives" "- name: ${1:Manages alternative programs for common commands}\n  alternatives: name=$2 path=$3 $0\n" "Manages alternative programs for common commands" ansible
			("system")
			nil nil nil nil)
		       ("at" "- name: ${1:Schedule the execution of a command or script file via the at command.}\n  at: count=$2 units=$3 $0\n" "Schedule the execution of a command or script file via the at command." ansible
			("system")
			nil nil nil nil)
		       ("authorized_key" "- name: ${1:Adds or removes an SSH authorized key}\n  authorized_key: user=$2 key=$3 $0\n" "Adds or removes an SSH authorized key" ansible
			("system")
			nil nil nil nil)
		       ("capabilities" "- name: ${1:Manage Linux capabilities}\n  capabilities: path=$2 capability=$3 $0\n" "Manage Linux capabilities" ansible
			("system")
			nil nil nil nil)
		       ("cron" "- name: ${1:Manage cron.d and crontab entries.}\n  cron: $0\n" "Manage cron.d and crontab entries." ansible
			("system")
			nil nil nil nil)
		       ("debconf" "- name: ${1:Configure a .deb package}\n  debconf: name=$2 $0\n" "Configure a .deb package" ansible
			("system")
			nil nil nil nil)
		       ("facter" "- name: ${1:Runs the discovery program I(facter) on the remote system}\n  facter: $0\n" "Runs the discovery program I(facter) on the remote system" ansible
			("system")
			nil nil nil nil)
		       ("filesystem" "- name: ${1:Makes file system on block device}\n  filesystem: fstype=$2 dev=$3 $0\n" "Makes file system on block device" ansible
			("system")
			nil nil nil nil)
		       ("firewalld" "- name: ${1:Manage arbitrary ports/services with firewalld}\n  firewalld: permanent=${2:true} state=${3:enabled} $0\n" "Manage arbitrary ports/services with firewalld" ansible
			("system")
			nil nil nil nil)
		       ("group" "- name: ${1:Add or remove groups}\n  group: name=$2 $0\n" "Add or remove groups" ansible
			("system")
			nil nil nil nil)
		       ("hostname" "- name: ${1:Manage hostname}\n  hostname: name=$2 $0\n" "Manage hostname" ansible
			("system")
			nil nil nil nil)
		       ("kernel_blacklist" "- name: ${1:Blacklist kernel modules}\n  kernel_blacklist: name=$2 $0\n" "Blacklist kernel modules" ansible
			("system")
			nil nil nil nil)
		       ("locale_gen" "- name: ${1:Creates of removes locales.}\n  locale_gen: name=$2 $0\n" "Creates of removes locales." ansible
			("system")
			nil nil nil nil)
		       ("lvg" "- name: ${1:Configure LVM volume groups}\n  lvg: vg=$2 $0\n" "Configure LVM volume groups" ansible
			("system")
			nil nil nil nil)
		       ("lvol" "- name: ${1:Configure LVM logical volumes}\n  lvol: vg=$2 lv=$3 $0\n" "Configure LVM logical volumes" ansible
			("system")
			nil nil nil nil)
		       ("modprobe" "- name: ${1:Add or remove kernel modules}\n  modprobe: name=$2 $0\n" "Add or remove kernel modules" ansible
			("system")
			nil nil nil nil)
		       ("mount" "- name: ${1:Control active and configured mount points}\n  mount: name=$2 src=$3 fstype=$4 state=$5 $0\n" "Control active and configured mount points" ansible
			("system")
			nil nil nil nil)
		       ("ohai" "- name: ${1:Returns inventory data from I(Ohai)}\n  ohai: $0\n" "Returns inventory data from I(Ohai)" ansible
			("system")
			nil nil nil nil)
		       ("open_iscsi" "- name: ${1:Manage iscsi targets with open-iscsi}\n  open_iscsi: $0\n" "Manage iscsi targets with open-iscsi" ansible
			("system")
			nil nil nil nil)
		       ("ping" "- name: ${1:Try to connect to host and return C(pong) on success.}\n  ping: $0\n" "Try to connect to host and return C(pong) on success." ansible
			("system")
			nil nil nil nil)
		       ("seboolean" "- name: ${1:Toggles SELinux booleans.}\n  seboolean: name=$2 state=$3 $0\n" "Toggles SELinux booleans." ansible
			("system")
			nil nil nil nil)
		       ("selinux" "- name: ${1:Change policy and state of SELinux}\n  selinux: state=$2 $0\n" "Change policy and state of SELinux" ansible
			("system")
			nil nil nil nil)
		       ("service" "- name: ${1:Manage services.}\n  service: name=$2 $0\n" "Manage services." ansible
			("system")
			nil nil nil nil)
		       ("setup" "- name: ${1:Gathers facts about remote hosts}\n  setup: $0\n" "Gathers facts about remote hosts" ansible
			("system")
			nil nil nil nil)
		       ("sysctl" "- name: ${1:Manage entries in sysctl.conf.}\n  sysctl: name=$2 $0\n" "Manage entries in sysctl.conf." ansible
			("system")
			nil nil nil nil)
		       ("ufw" "- name: ${1:Manage firewall with UFW}\n  ufw: $0\n" "Manage firewall with UFW" ansible
			("system")
			nil nil nil nil)
		       ("user" "- name: ${1:Manage user accounts}\n  user: name=$2 $0\n" "Manage user accounts" ansible
			("system")
			nil nil nil nil)
		       ("zfs" "- name: ${1:Manage zfs}\n  zfs: name=$2 state=$3 $0\n" "Manage zfs" ansible
			("system")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("accelerate" "- name: ${1:Enable accelerated mode on remote node}\n  accelerate: $0\n" "Enable accelerated mode on remote node" ansible
			("utilities")
			nil nil nil nil)
		       ("assert" "- name: ${1:Fail with custom message}\n  assert: that=$2 $0\n" "Fail with custom message" ansible
			("utilities")
			nil nil nil nil)
		       ("debug" "- name: ${1:Print statements during execution}\n  debug: $0\n" "Print statements during execution" ansible
			("utilities")
			nil nil nil nil)
		       ("fail" "- name: ${1:Fail with custom message}\n  fail: $0\n" "Fail with custom message" ansible
			("utilities")
			nil nil nil nil)
		       ("fireball" "- name: ${1:Enable fireball mode on remote node}\n  fireball: $0\n" "Enable fireball mode on remote node" ansible
			("utilities")
			nil nil nil nil)
		       ("include_vars" "- name: ${1:Load variables from files, dynamically within a task.}\n  include_vars: free-form=$2 $0\n" "Load variables from files, dynamically within a task." ansible
			("utilities")
			nil nil nil nil)
		       ("pause" "- name: ${1:Pause playbook execution}\n  pause: $0\n" "Pause playbook execution" ansible
			("utilities")
			nil nil nil nil)
		       ("set_fact" "- name: ${1:Set host facts from a task}\n  set_fact: key_value=$2 $0\n" "Set host facts from a task" ansible
			("utilities")
			nil nil nil nil)
		       ("wait_for" "- name: ${1:Waits for a condition before continuing.}\n  wait_for: $0\n" "Waits for a condition before continuing." ansible
			("utilities")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("apache2_module" "- name: ${1:enables/disables a module of the Apache2 webserver}\n  apache2_module: name=$2 $0\n" "enables/disables a module of the Apache2 webserver" ansible
			("web_infrastructure")
			nil nil nil nil)
		       ("django_manage" "- name: ${1:Manages a Django application.}\n  django_manage: command=$2 app_path=$3 $0\n" "Manages a Django application." ansible
			("web_infrastructure")
			nil nil nil nil)
		       ("ejabberd_user" "- name: ${1:Manages users for ejabberd servers}\n  ejabberd_user: username=$2 host=$3 $0\n" "Manages users for ejabberd servers" ansible
			("web_infrastructure")
			nil nil nil nil)
		       ("htpasswd" "- name: ${1:manage user files for basic authentication}\n  htpasswd: path=$2 name=$3 $0\n" "manage user files for basic authentication" ansible
			("web_infrastructure")
			nil nil nil nil)
		       ("jboss" "- name: ${1:deploy applications to JBoss}\n  jboss: deployment=$2 $0\n" "deploy applications to JBoss" ansible
			("web_infrastructure")
			nil nil nil nil)
		       ("jira" "- name: ${1:create and modify issues in a JIRA instance}\n  jira: uri=$2 operation=$3 username=$4 password=$5 $0\n" "create and modify issues in a JIRA instance" ansible
			("web_infrastructure")
			nil nil nil nil)
		       ("supervisorctl" "- name: ${1:Manage the state of a program or group of programs running via supervisord}\n  supervisorctl: name=$2 state=$3 $0\n" "Manage the state of a program or group of programs running via supervisord" ansible
			("web_infrastructure")
			nil nil nil nil)))


;;; Do not edit! File generated at Thu Sep  4 09:32:11 2014
