# Ansible for Raspberry Thicket

Playbooks for configuring the Raspberry Thicket (4-node microk8s cluster).

## Usage

Run ansible playbooks like so (`ping.yml`, for example:

```
ansible-playbook -i inventories/homelab.yml ping.yml
```

## Playbooks and order

| Playbook              | Description |
|-----------------------|-------------|
| ping.yml             | quick testing playbook to check connectivity |
| new-raspberry-pi.yml | some updates to the pis, starting from first boot after os flash |
| etc-hosts.yml        | populate the pis' hosts files for inter-pi communication |
| microk8s-prepare.yml | dependencies for installing microk8s |
| microk8s-install.yml | install microk8s |
| microk8s-manager.yml | prepare the first node for others to join |
| microk8s-workers.yml | join the other nodes to the cluster |

### Other files

- ansible.cfg: some configuration
- inventory.yml: just the collection of infrastructure
- known-hosts.yml: an attempt to add the thicket pis fingerprints to control node's known_hosts file; not yet successful
- lookup_plugins/host_ssh_keys.py: a lookup plugin used by known-hosts.yml
- cmdline.yml: a helper playbook, is called from microk8s-prepare.yml
- vault.yml: ansible vault, contains encrypted secrets

