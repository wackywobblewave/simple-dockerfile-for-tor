# simple dockerfile for hosting a tor website
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
_Create the Caddyfile and torrc before you create the container._
_You don't need to open any ports for Caddy, because Tor will access it via the Docker network._


An example of the torrc
````
 HiddenServiceDir /var/lib/tor/example
 HiddenServicePort 80 caddy:80
````

An example of the Caddyfile
````
:80 {
        file_server
}
````
