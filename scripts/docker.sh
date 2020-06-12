echo "Updating repositories" &&
sudo apt-get update &&

echo "Installing necessary packages: " &&
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common &&
echo "Adding GPG key of Docker" &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&

echo "Adding docker repository to additional repo: " &&
# Check if the file exists or not
sudo echo 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable' >>  /etc/apt/sources.list.d/additional-repositories.list &&

echo "Repository added"
#Ask user for version number; default latest
echo "Installing docker (latest version): " &&
sudo apt-get update &&

sudo apt-get install docker docker-ce-cli containerd.io &&

#docker group is created most of the time omit this or check if docker group exists or not
echo "Adding user to docker group" &&
sudo groupadd docker &&

sudo usermod -aG docker $USER &&

newgrp docker &&

echo "Enabling docker on boot: "

#Verify by docker run hello-world
sudo systemctl enable docker &&

echo "Installation finished"

