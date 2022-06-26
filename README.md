# Server.coop

## Step 1
Get a fresh ubuntu instance up and running with root access (VM or otherwise) that is accessible to the outside would.  If you have Xfinity with their provided modem, you are going to run into issues because they don't let you change your Public DNS IP, and so for some reason your website is only assessable externally.  This won't be an issue once you have scaled to multiple distributed computers with different IPs, or are running your server externally.  If you run into issues, try running it on a cheap virtual server provider and see if that works (of course, that will cost a little bit but there are ones that you can get for under 10 U.S. Dollars/Euros.
SSH into your new server and make sure you are in the ubuntu home directory, then type `sudo su` to get into root mode.
Also, make sure you have sub domains set up with your domain registrar for 'traeafik.yoururl.org', 'server.yoururl.org`, `next.yoururl.org`, 'portainer.yoururl.org`, and `phpmyadmin.yoururl.org`

## Step 2
Install Drupal and other requirements by running `./installStuff.sh`

## Step 3
Run `docker swarm init --advertise-addr ###.###.###.###`, replacing `###.###.###.###` with the public IP of your server (not 10.###.###.### or 192.168.###.###, if you are running your server locally, see caveat in Step 1 do a search for 'What is my IP') to setup swarm mode to make things distributed.

## Step 4
Run: `docker network create -d overlay --attachable traefik-public` to get an external Docker network

## Step 5
Run `export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')` to make the swarm IP an external variable.

## Step 6
Create a Docker tag in this node, so that Traefik is always deployed to the same node and uses the same volume: `docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID`

## Step 7
Create a `secrets` folder below the servercoop git directory and create an .env file 

## Step 8
Create a file called `.env` with the following variables filled out:

	MYSQL_ROOT_PASSWORD=
	MYSQL_DATABASE=
	MYSQL_USER=
	MYSQL_PASSWORD=
	NODE_ID=
	EMAIL=
	DOMAIN=traefik.yoururl.org
	DOMAINSERVER=server.yoururl.org
	USERNAME=admin
	#traefik password
	PASSWORD=
	#run 
	#openssl passwd -apr1 
	#[Your Password]
	#and enter the results here, it will look something like this 
	#$apr1$89eqM5Ro$CxaFELthUKV21DpI3UTQO.
	HASHED_PASSWORD=
	COOKIE_DOMAIN=portainer.yoururl.org
	INSECURE_COOKIE=false
	#an email address
	WHITELIST=
	LOG_LEVEL=warning
	LOG_FORMAT=text
	LIFETIME=2592000 # 30 days
	PMA_ABSOLUTE_URI=https://phpmyadmin.yoururl.org/
	PMA_HOST=db

## Step 9
Inspect `traefik.yml` and edit the parts between  the [ … ]

## Step 10
Run `docker stack deploy -c traefik.yml traefik`

## Step 11
Go to https://traefik.[Your URL].org and check it out

###
Not Done!
