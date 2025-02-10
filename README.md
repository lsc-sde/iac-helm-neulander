# Helm chart for NeuLander

ToDo: Documentation to be updated.

This is a pre-alpha Helm chart that needs plenty more work with extracting many hardcoded parameters into template vars. 

It has only been tested on microk8s at this point in time. 

The helm chart expects to be installed in a namespace called `neulander`. 

It expects two kubernetes secrets to be present in this namespace before deployment.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: neulander-api
  namespace: neulander
type: Opaque
data:
  api-key: <base64 encoded api-key>
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: neulander-rmq-nondefault-user
  namespace: neulander
type: Opaque
data:
  username: <base64 encoded username for rabbitmq user>
  password: <<base64 encoded password for rabbitmq user>
  connection_string: <base64 encoded amqp://neulander-rmq.neulander.svv/ (note the trailing slash)>
  ```