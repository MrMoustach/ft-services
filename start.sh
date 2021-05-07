minikube delete
minikube start
eval $(minikube docker-env)
docker build srcs/images/phpmyadmin -t phpmyadmin
docker build srcs/images/wordpress -t wordpress
docker build srcs/images/mysql -t mysql
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/deployment/metallb/metallb.yaml
kubectl apply -f srcs/deployment/wordpress/wordpress.yaml
kubectl apply -f srcs/deployment/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/deployment/mysql/mysql.yaml