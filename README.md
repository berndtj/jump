# Creating a jump host for Photon Controller

## Create an Ubuntu 14.04 VM

We are using 14.04 because 16.04 will not properly boot.  You can
of course still use 16.02, but you cannot use the cloud image, you
would have to install from ISO.

1. Download the cloud image from ubuntu:
    - https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64.ova

2. Create a seed ISO for cloud config
    - The script assumes that you have a key `id_rsa.pub` in `$HOME/.ssh`
    - `$ ./seed.sh` will output `seed.iso`

3. Attach seed.iso and start the VM from the 14.04 ova.
    - I could not mount the ISO (via CD rom) on first boot via the ESXi web client.
      I had to attach after first boot and restart.
    - Keep the seed.iso attached for subsequent reboots.
    - Once it boots you should be able to log into the host as user `ubuntu`

4. Add network adapter for the private network via the ESXi web client

5. Configure the interfaces
    - `ansible-playbook -i <ip_address>, setup.yaml
    - reboot

6. Setup iptables
    - `ansible-playbook -i <ip_address>, iptables.yaml

7. Setup openvpn
    - `ansible-playbook -i <ip_address>, openvpn.yaml

At this point you should have a functioning jump host.