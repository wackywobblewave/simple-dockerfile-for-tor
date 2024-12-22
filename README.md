# simple dockerfile for tor
[Dockerfile](https://github.com/wackywobblewave/simple-dockerfile-for-tor/blob/main/Dockerfile)

Example of a possible Docker Compose with it:
````
services:
  tor:
    build: .
    volumes:
       - ./tor:/var/lib/tor/ 
       - ./torrc:/etc/tor/torrc
    restart: unless-stopped

  caddy:
    image: caddy:latest
    restart: unless-stopped
    volumes:
      - ./caddy/Caddyfile:/etc/caddy/Caddyfile
      - ./caddy/site:/srv
      - ./caddy/caddy_data:/data
      - ./caddy/caddy_config:/config
````

An example of the torrc
````
 HiddenServiceDir /var/lib/tor/site
 HiddenServicePort 80 caddy:80
````

