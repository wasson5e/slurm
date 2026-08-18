# SLURM

## Node Information
- pi5b-node1 - control system/desktop/
- pi5b-node2 - nfs server/router/

- pi4b-node1/2/3/4 - cluster systems

## Pi5b-node2
### Install NFS server Debian 13 Trixie
1) Service installation

`sudo apt install -y nfs-kernel-server`

2) IDMAP configuration
```
sudo vim /etc/idmapd.conf
Domain = aaronwasson.net
```

3) Exports
```
sudo vim /etc/exports
/media/exports 192.168.10.0/24(rw,no_root_squash)

sudo mkdir /media/exports
sudo systemctl restart nfs-server
```
4) Check from external machine

`showmount -e 192.168.10.19`

5) create the cluster group for permissions
```
sudo groupadd -g 1500 cluster
sudo chown root:cluster /media/cluster
sudo usermod -aG cluster awasson
```


## Cluster Nodes
1) Install nfs-common

`sudo apt update && sudo apt install -y nfs-common`

2) Edit fstab

```
sudo vim /etc/fstab

pi5b-node2.aaronwasson.net:/media/cluster    /media/cluster  nfs     rw,defaults     0 0

```
3) Create share location

` sudo mkdir -p /media/cluster `

4) Mount share

`sudo mount /media/cluster `

5) Install MUNGE

`sudo apt install munge libmunge2 libmunge-dev`

6) Create MUNGE Key

*Might already exist at /etc/munge/munge.key*

Copy to nfs share and move to location

IF Not:

`sudo mungekey --create --verbose`

Copy to nfs share and move to location

7) Update owner and permissions

```
sudo chown -R munge: /etc/munge/ /var/log/munge/ /var/lib/munge/ /run/munge/ && \
sudo chmod 0700 /etc/munge/ /var/log/munge/ /var/lib/munge/ && \
sudo chmod -755 /run/munge/
```

8) Enable Munge

`sudo systemctl enable munge && sudo systemctl start munge`

9) Update user groups

`sudo usermod -aG munge awasson`

10) install additional packages

```
apt-get install build-essential fakeroot devscripts equivs
```
11) Check that munge actually works
`munge -n | unmunge`