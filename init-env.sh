# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.1.0".
nvm current # Should print "v24.1.0".

# Verify npm version:
npm -v # Should print "11.3.0".

############################################################################################

# Download go 1.24.4 tar
curl -O https://dl.google.com/go/go1.24.4.linux-amd64.tar.gz

# Remove any previous Go installation by deleting the /usr/local/go folder (if it exists), 
# then extract the archive you just downloaded into /usr/local, 
# creating a fresh Go tree in /usr/local/go:
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz

# Add go to PATH
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

# Check version 
go version

source ~/.bashrc

rm go1.24.4.linux-amd64.tar.gz

############################################################################################

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

echo "export PATH=$PATH:/opt/nvim-linux-x86_64/bin" >> ~/.bashrc
rm nvim-linux-x86_64.tar.gz

git clone https://github.com/pr0h0/config.git config-git
cp -r config-git/nvim .config/nvim

############################################################################################
# remove old installs
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove runc; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# install all required something
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# test if it works
sudo docker run hello-world

# do this so we dont have to use sudo with docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

# add docker to run on startup
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
