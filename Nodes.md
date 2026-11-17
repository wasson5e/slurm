192.168.10.34	pi4b-node1	pi4b-node1.aaronwasson.net
192.168.10.35	pi4b-node2	pi4b-node2.aaronwasson.net
192.168.10.36	pi4b-node3	pi4b-node3.aaronwasson.net
192.168.10.40	pi4b-node4	pi4b-node4.aaronwasson.net
192.168.10.41	pi5b-node1	pi5b-node1.aaronwasson.net
192.168.10.42	pi5b-node2	pi5b-node2.aaronwasson.net

switch password - zPbL43IMd549sBL

/etc/cloud/templates/hosts.debian.tmpl


# a.) make changes to the master file in /etc/cloud/templates/hosts.debian.tmpl
# b.) change or remove the value of 'manage_etc_hosts' in
#     /etc/cloud/cloud.cfg or cloud-config from user-data

## Troubleshooting

```
awasson@pi5b-node1:/etc $ sacct
sacct: error: _open_persist_conn: failed to open persistent connection to host:pi5b-node2.aaronwasson.net:6819: Connection refused
sacct: error: Sending PersistInit msg: Connection refused
sacct: error: Problem talking to the database: Connection refused
```

- Check that the slurmdbd is running on pi5b-node2

/media/cluster/slurm_installers/slurm-26.05.2/debian/tmp/usr/bin//scontrol