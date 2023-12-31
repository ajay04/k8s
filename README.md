# k8s
Here's a table outlining some of the differences in commonly used commands between OpenShift (`oc` command) and Kubernetes (`kubectl` command):

| **Task**                                | **OpenShift (`oc`)**                  | **Kubernetes (`kubectl`)**            |
|-----------------------------------------|--------------------------------------|--------------------------------------|
| **Get Cluster Information**             | `oc cluster-info`                    | `kubectl cluster-info`                |
| **Login to Cluster**                    | `oc login <cluster-url>`             | `kubectl config use-context <context>`|
| **Get Nodes**                           | `oc get nodes`                       | `kubectl get nodes`                   |
| **Get Pods**                            | `oc get pods`                        | `kubectl get pods`                    |
| **Get Services**                        | `oc get services`                    | `kubectl get services`                |
| **Get Deployments**                     | `oc get deployments`                 | `kubectl get deployments`             |
| **Create Namespace/Project**            | `oc new-project <project-name>`      | `kubectl create namespace <namespace>`|
| **Switch Namespace/Project**            | `oc project <project-name>`          | `kubectl config set-context --current --namespace=<namespace>`|
| **Describe Resource**                   | `oc describe <resource> <name>`     | `kubectl describe <resource> <name>`  |
| **Expose Service**                      | `oc expose service <service-name>`  | `kubectl expose deployment <deployment-name> --type=NodePort --name=<service-name>`|
| **Scale Deployment**                    | `oc scale --replicas=<count> deployment/<deployment-name>` | `kubectl scale --replicas=<count> deployment <deployment-name>`|
| **Create Secret**                       | `oc create secret generic <secret-name> --from-literal=<key>=<value>` | `kubectl create secret generic <secret-name> --from-literal=<key>=<value>`|
| **Apply Configuration**                 | `oc apply -f <yaml-file>`           | `kubectl apply -f <yaml-file>`        |
| **Delete Resource**                     | `oc delete <resource> <name>`       | `kubectl delete <resource> <name>`    |
| **Get Events**                          | `oc get events`                      | `kubectl get events`                  |

Please note that while many commands are similar, some differences exist due to variations in terminology and additional features provided by OpenShift. Always refer to the respective documentation for the most accurate and up-to-date information.