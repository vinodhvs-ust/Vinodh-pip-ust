## ADD Helm Repo
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts

## Install the chart
helm install csi secrets-store-csi-driver/secrets-store-csi-driver


helm uninstall vault hashicorp/vault \
    --set "server.dev.enabled=true" \
    --set "injector.enabled=false" \
    --set "csi.enabled=true"




    vinod@ip-10-199-25-201:~$ kubectl exec -it -n vault  vault-0 -- /bin/sh
/ $ vault login root
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

Key                  Value
---                  -----
token                root
token_accessor       2NMDg2sEao0J4uJ43reOiPNB
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]