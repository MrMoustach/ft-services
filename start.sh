#!/bin/zsh
echo "-------------Starting deployment-------------"
echo '
  __ _                            _
 / _| |_      ___  ___ _ ____   _(_) ___ ___  ___
| |_| __|____/ __|/ _ \ |__\ \ / / |/ __/ _ \/ __|
|  _| ||_____\__ \  __/ |   \ V /| | (_|  __/\__ \
|_|  \__|    |___/\___|_|    \_/ |_|\___\___||___/'
echo "- \e[32mSetting up minikube 😆\e[39m"
minikube delete > /dev/null
minikube start --driver=virtualbox
eval $(minikube docker-env)
echo "- \e[32msetting up files 🙃\e[39m"

export HTTP_IP="192.168.99.105"
echo "HTTP_IP is $HTTP_IP  😛"

sed "s/HTTP_IP/$HTTP_IP/g" srcs/deployment/metallb/metallb_sample.yaml > srcs/deployment/metallb/metallb.yaml
sed "s/HTTP_IP/$HTTP_IP/g" srcs/images/mysql/wordpress_sample.sql > srcs/images/mysql/wordpress.sql
sed "s/HTTP_IP/$HTTP_IP/g" srcs/images/nginx/default_sample.conf > srcs/images/nginx/default.conf
echo "- \e[32mBuilding images 🤨\e[39m"

docker build srcs/images/phpmyadmin -t phpmyadmin > /dev/null
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32mPhpmyadmin is built ✅\e[39m"
else
  echo "\e[31Building phpmyadmin failed ❌\e[39m"
fi

docker build srcs/images/wordpress -t wp > /dev/null
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32mWordpress is built ✅\e[39m"
else
  echo "\e[31Building Wordpress failed ❌\e[39m"
fi

docker build srcs/images/mysql -t mysql > /dev/null
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32mMysql is built ✅\e[39m"
else
  echo "\e[31Building Mysql failed ❌\e[39m"
fi

docker build srcs/images/nginx -t nginx > /dev/null
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32mNginx is built ✅\e[39m"
else
  echo "\e[31Building Nginx failed ❌\e[39m"
fi

echo "- \e[32mSetting up Metal-lb 🤩\e[39m"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null

echo "- \e[32mDeploying YAML files 🧐\e[39m"

kubectl apply -f srcs/deployment/metallb/metallb.yaml > /dev/null 
kubectl apply -f srcs/deployment/wordpress/wordpress.yaml > /dev/null
kubectl apply -f srcs/deployment/phpmyadmin/phpmyadmin.yaml > /dev/null
kubectl apply -f srcs/deployment/mysql/mysql.yaml > /dev/null
kubectl apply -f srcs/deployment/nginx/nginx.yaml > /dev/null
echo "- \e[32mFinishing up and starting dashboard 🥳🥳\e[39m"

minikube dashboard
echo "- \e[32mDeleting created files 😖\e[39m"

rm srcs/deployment/metallb/metallb.yaml srcs/images/mysql/wordpress.sql srcs/images/nginx/default.conf > /dev/null