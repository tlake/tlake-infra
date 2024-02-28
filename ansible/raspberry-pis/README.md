# Ansible for Raspberry Thicket

Playbooks for configuring the Raspberry Thicket (4-node microk8s cluster).

## Usage

Run ansible playbooks like so (`ping.yaml`, for example):

```
ansible-playbook -i inventory.yaml -e @vault.yaml --vault-password-file=.vault_pass ping.yaml
```

## Playbooks and order

| Playbook | Description |
|----------|-------------|
| ping.yaml | quick testing playbook to check connectivity |
| new-raspberry-pi.yaml | some updates to the pis, starting from first boot after os flash |
| microk8s-prepare.yaml | dependencies for installing microk8s |
| microk8s-install.yaml | install microk8s |
| microk8s-manager.yaml | prepare the first node for others to join |
| microk8s-workers.yaml | join the other nodes to the cluster |

### Other files

- inventory.yaml: just the collection of infrastructure
- known-hosts.yaml: an attempt to add the thicket pis fingerprints to known_hosts file; not yet successful
- lookup_plugins/host_ssh_keys.py: a lookup plugin used by known-hosts.yaml
- cmdline.yaml: a helper playbook, is called from microk8s-prepare.yaml
- vault.yaml: ansible vault, contains encrypted secrets

