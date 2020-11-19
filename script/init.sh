# ORIG_PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/vagrant/.local/bin:/home/vagrant/bin"
# export PATH=$ORIG_OPATH
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo yum install -y git yum-utils

echo "Starting Docker"
sudo systemctl start docker

# kubectl
if [[ ! -f /usr/local/bin/kubectl ]] ; then
	curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
fi
/usr/local/bin/kubectl version --client

# minikube
if [[ ! -f /usr/local/bin/minikube  ]] ; then
	echo "Installing Minikube"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
	echo "Minikube is installed..."
fi
echo "Minikube version: "
/usr/local/bin/minikube version

# helm 
if [[ ! -f /usr/local/bin/helm ]] ; then
	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
	chmod +x get_helm.sh
	./get_helm.sh
fi
echo "Helm version:"
/usr/local/bin/helm version