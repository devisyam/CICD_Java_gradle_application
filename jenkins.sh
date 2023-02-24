sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  yum install git -y
  git init .
  sudo amazon-linux-extras install java-openjdk11
  yum install jenkins -y
  systemctl restart jenkins

