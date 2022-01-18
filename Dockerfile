FROM summerwind/actions-runner:latest

RUN sudo apt update -y \
  && pip3 install awscli \
  && sudo wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip \
  && sudo unzip terraform_0.12.21_linux_amd64.zip && sudo rm terraform_0.12.21_linux_amd64.zip \
  && sudo mv terraform /usr/bin/terraform \
  && sudo  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && sudo chmod +x ./kubectl \
  && sudo mv ./kubectl /usr/local/bin/kubectl \
  && sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip \
  && sudo unzip sonar-scanner-cli-4.6.2.2472-linux.zip \
  && sudo rm -rf sonar-scanner-cli-4.6.2.2472-linux.zip \
  && sudo rm -rf sonar-scanner-cli-4.6.2.2472-linux/jre/Welcome.html \
  && sudo ln -s /sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner  \
  && sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
  && sudo chmod +x get_helm.sh && ./get_helm.sh \
  && sudo rm -rf /var/lib/apt/lists/*

