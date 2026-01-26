# Portainer Forwarder (Stable URL in front of Portainer webhooks)

## Why
Portainer webhook URLs include a token and are coupled to the Portainer hostname.
A **forwarder** gives CI a stable URL that you can re-point later.

CI calls:
`https://deploy.polyhydragames.com/portainer/api-documents`

Nginx forwards to:
`https://portainer.polyhydragames.com/api/stacks/webhooks/<TOKEN>`

## Nginx example (raw)
```nginx
server {
  listen 443 ssl;
  server_name deploy.polyhydragames.com;

  location /portainer/api-documents {
    limit_except POST { deny all; }

    proxy_pass https://portainer.polyhydragames.com/api/stacks/webhooks/<TOKEN>;
    proxy_set_header Host portainer.polyhydragames.com;
    proxy_set_header X-Forwarded-For $remote_addr;
    proxy_set_header X-Forwarded-Proto https;
  }
}
```

## Nginx Proxy Manager
Create Proxy Host:
- Domain: `deploy.polyhydragames.com`
- Forward host: `portainer.polyhydragames.com`
- Forward port: `443`
- SSL on

Custom Nginx Config:
```nginx
location /portainer/api-documents {
  limit_except POST { deny all; }
  proxy_pass https://portainer.polyhydragames.com/api/stacks/webhooks/<TOKEN>;
  proxy_set_header Host portainer.polyhydragames.com;
  proxy_set_header X-Forwarded-For $remote_addr;
}
```

## Security tips
- Prefer the forwarder URL in CI (no token exposed)
- Optionally add Basic Auth or require a header
- Rate-limit if exposed publicly
