### Lokalen Storage auf node-2 anlegen

```bash
# kubectl konfigurieren
vagrant ssh node-1
cp .kube/config /vagrant/kube-config
exit

vagrant ssh node-2
mkdir .kube
cp /vagrant/kube.config .kube/config

# kubectl testen
kubectl get pods --all-namespaces

# persistent Volume anlegen
sudo mkdir /mnt/data
sudo echo "Hallo aus dem lokalen Volume auf node-2" > /mnt/data/index.html

kubectl apply -f storage/pv-volume.yaml
kubectl apply -f storage/pv-pod.yaml
```