helm repo add hashicorp https://helm.releases.hashicorp.com

helm repo update

helm install vault hashicorp/vault \
    --set "server.dev.enabled=true" \
    --set "injector.enabled=false" \
    --set "csi.enabled=true"



    ##iam using hashicorp officil helm chart and passing some values in runtime
    