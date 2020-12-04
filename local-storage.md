### Lokalen Storage auf node-2 anlegen

```bash
# kubectl konfigurieren
vagrant ssh node-1
cp .kube/config /vagrant/kube-config
exit

vagrant ssh node-2
mkdir .kube
cp /vagrant/kube-config .kube/config

# kubectl testen
kubectl get pods --all-namespaces

#Bash Autovervollständigen
echo 'source <(kubectl completition bash)' >>~/.bashrc
source .bashrc

# persistent Volume anlegen
sudo mkdir /mnt/data
sudo sh -c "echo 'Hallo aus dem lokalen Volume auf node-2' > /mnt/data/index.html"

kubectl apply -f /vagrant/storage/pv-volume.yaml
kubectl apply -f /vagrant/storage/pv-pod.yaml
```