# Docker Stacks

YAML files describing Docker stack configurations, intended to be consumed by Portainer.

## Traefik Port Allocation

A container must have an exposed host port in order for Traefik to route requests to it.
These host ports must be unique, so this is where I'll maintain that list of ports for quicker reference.

| Host Port : Container Port | Traefik-fronted? | Stack : Container |
|----------------------------|------------------|-------------------|
|    80 : 80                 | n                | traefik |
|   222 : 22                 | n                | gitea : app |
|   443 : 443                | n                | traefik |
|  3000 : 3000               | Y                | gitea : app |
|  3333 : 3333               | Y                | ghostfolio : app |
|  5000 : 5000               | Y                | docker_registry : app |
|  5006 : 5006               | Y                | actualbudget : server |
|  5299 : 5299               | Y                | ebooks : lazylibrarian |
|  5432 : 5432               | n                | ghostfolio : postgres |
|  6379 : 6379               | n                | ghostfolio : redis |
|  8080 : 8080               | n                | traefik |
|  8001 : 8080               | Y                | firefly_iii : app |
|  8002 : 8080               | Y                | firefly_iii : importer |
|  8888 : 80                 | Y                | vaultwarden : app |
| 10010 : 8080               | n                | ebooks : calibre |
| 10011 : 8081               | n                | ebooks : calibre |
| 10012 : 8181               | n                | ebooks : calibre |
| 10013 : 8083               | Y                | ebooks : calibreweb |
| 10100 : 80                 | Y                | nextcloud : proxy |
| 10300 : 53/tcp             | n                | pihole : app |
| 10300 : 53/udp             | n                | pihole : app |
| 10301 : 67/udp             | n                | pihole : app |
| 10302 : 80/tcp             | Y                | pihole : app |
| 11080 : 80                 | Y                | home_proxy : app |
| 11443 : 443                | n                | home_proxy : app |
| 25565 : 25565/udp          | n                | traefik |
| artemicion:25565 : 25565   | Y                | minecraft : app |
| 30000 : 30000              | Y                | foundryvtt : app |
| 30001 : 30000              | Y                | foundryvtt_andrew : app |
