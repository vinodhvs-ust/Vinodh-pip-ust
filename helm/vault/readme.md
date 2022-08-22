

helm upgrade  vault hashicorp/vault   --set "server.dev.enabled=true" --set "injector.enabled=false" --set "csi.enabled=true" --set "ui.serviceTy
pe=LoadBalancer" --set "ui.enabled=true"


vault write auth/kubernetes/role/csi-kv \
bound_service_account_names=csi-sa \
bound_service_account_namespaces=app \
policies=kv_policy \
ttl=20m
   role we are creating in vault is csi-kv

   ## Put some Sample data 

vault kv put kv/db password=password

vault kv put kv/app user=admin


###vault can be accessed here

http://a87445851ea7945c89b904d618614b30-663964140.eu-west-1.elb.amazonaws.com:8200/ui/

