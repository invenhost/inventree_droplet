# InvenTree Droplet
DigitalOcean Droplet for InvenTree, the intuitive open-source inventory management. This repo includes the scripts needed to build the droplet.

## CI
This repo includes an action to build the droplet using packer (the command runs over 10 minutes - I do not need that on my laptop).  
There is a private repo that runs security checks after the action finishes. I might open source that later.

## Listing
View the resulting listing on the [marketplace page](https://marketplace.digitalocean.com/apps/inventree?refcode=d6172576d014) and consider deploying it from there. This link is an affiliate link - I might earn a commission if you decide to use the app in a base droplet for longer than 5 months.
You only need the most basic 5$ droplet to run this app - a bit more memory might help, but more than 4 GB is total overallocation - spend those resources on something nice 😇.  

## Credits
This repo is originally a fork of https://github.com/digitalocean/marketplace-partners and thus uses Apache 2.0 license.
