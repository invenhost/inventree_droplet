# InvenTree Droplet
DigitalOcean droplet for InvenTree, the open-source PLM.  
This repo contains the scripts needed to build the droplet.

## CI
There is an action that builds the droplet using packer (the command runs over 10 minutes) - this then needs to be submitted manually to the marketplace.

### Steps
The only custom things are:
- `01-inventree`: Add postgres database and install inventree
- `001_onboot`: Generate passwords, update postgres passwords, run updates, install DO console
- `99-one-click`: MOTD that shows some info about the server

## Listing
View the resulting listing on the [marketplace page](https://marketplace.digitalocean.com/apps/inventree?refcode=d6172576d014) and consider deploying it from there.  
This link is an affiliate link - I might earn a commission if you decide to use the app in a base droplet for longer than 5 months.
You only need the most basic 6$ droplet to run this app - a bit more memory might help, but more than 4 GB is total overallocation - spend those resources on something nice 😇.  

## Credits
This repo is a fork of https://github.com/digitalocean/marketplace-partners and thus uses Apache 2.0 license.
