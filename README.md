# Reference
Creates an (all-in-one) guacamole, VNC and TLS termination server using podman w/ mysql for auth.

# Deployment
```
# build the TLS termination container
cd tls
$ ./generate_certs_and_build.sh

# local example (RHEL8)
$ ansible-playbook guacamole.yaml --extra-vars="target=localhost"
```

# Notes
```
- if needed, database credentials are available in /opt/guacamole on the docker host.
- guacadmin:guacadmin are the default web admin credentials.
- https://localhost:8443/guacamole is the default web endpoint.
- tested with CentOS 8 and RHEL 8
- the VNC connection needs to be configured manually in Guacamole:
	hostname: localhost
	port: 5901
	password: my-pw
```
