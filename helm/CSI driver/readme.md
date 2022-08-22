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



I am using the vault kv backend to store my secrets. I have already uploaded a couple of secrets in the vault kv backend earlier. We will create a secret class to fetch the secrets from the KV backend.

Secret Storage Class

a) provider: The name of the secret storage class to be used. Here we will be using vault as the secret storage class provider.

b) roleName: The name of the Vault KV role to be used for authentication.

c) vaultAddress: The address where the vault is exposed.

d) Objects: The KV paths from where secrets are to be extracted



Creating a Deployment:

now create a deployment that will use this Secret Provider class to mount the secrets as a volume to the deployment

kubectl apply -f vault-csi.yaml

we should now see that the secrets are mounted to “/mnt/secrets-store” location on the Pod
