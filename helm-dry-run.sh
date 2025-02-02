##############################################################################

cp -r /mnt/c/Users/vishnu.chandrabalan/.kube/config ~/.kube/config

CURRENTAKSCONTEXT=$(kubectl config current-context)
AKSNAME=aks-lander-core-prd-02
kubectl config use-context $AKSNAME

##############################################################################

NAMESPACE=neulander
HELM_RELEASE=neulander01
HELM_CHART="./"

helm upgrade \
    --cleanup-on-fail \
    --install  $HELM_RELEASE $HELM_CHART \
    --namespace $NAMESPACE \
    --create-namespace \
    --values values.yaml \
    --dry-run

##############################################################################
kubectl config use-context $CURRENTAKSCONTEXT
##############################################################################
