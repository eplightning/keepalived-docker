# Lightweight Docker image for Keepalived

Alpine based Docker image for Keepalived. Available variants:
- default - keepalived + basic network admin tools  - latest,
- python - default + python3 + python3 requests lib for easy healthcheck scripts - python.

Images are built and available on Dockerhub

```
docker run bslawianowski/keepalived:v2.2.0 keepalived --version
docker run bslawianowski/keepalived:v2.2.0-python keepalived --version
```

## Example

Keepalived requires ip_vs kernel module to be loaded on the host

```shell
docker run --network host \
           -v /path/to/your/keepalived.conf:/etc/keepalived/keepalived.conf:ro \
           --cap-add=NET_ADMIN --cap-add=NET_BROADCAST --cap-add=NET_RAW \
           bslawianowski/keepalived:latest
```

For running scripts, `keepalived_script` user is available inside container, which has UID 500 and GID 100.
