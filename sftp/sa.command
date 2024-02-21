commands--
oc new-project authorization-scc

oc new-app --name gitlab --image quay.io/redhattraining/gitlab-ce:8.4.3-ce.0

Log in as the admin user

oc get pod/pod-id -o yaml | oc adm policy scc-subject-review -f -

oc create sa sftp-sa

oc adm policy add-scc-to-user anyuid -z sftp-sa

Log in as the developer user

oc set serviceaccount deployment/sftp-server sftp-sa

oc expose service/gitlab --port 80 --hostname gitlab.apps.ocp4.example.com


oc adm policy add-scc-to-user anyuid -z default scc “anyuid” added to: [“system:serviceaccount:sftp:default”]


docker run \
    -v ./.ssh/id_rsa.pub:/home/foo/.ssh/authorized_keys:ro \
    -v ./share:/home/foo \
    -p 9000:22 -d atmoz/sftp \
    foo::1001

    docker run \
    -v ./ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key \
    -v ./ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key \
    -v ./ssh_host_ed25519_key.pub:/home/foo/.ssh/ssh_host_ed25519_key.pub:ro \
    -v ./ssh_host_rsa_key.pub:/home/foo/.ssh/ssh_host_rsa_key.pub:ro \
    -v ./authorized_keys:/home/foo/.ssh/authorized_keys:ro \
    -p 9000:22 -d atmoz/sftp \
    foo::1001

    docker run \
    -v ./ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key \
    -v ./ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key \
    -v ./ssh_host_ed25519_key.pub:/home/foo/.ssh/ssh_host_ed25519_key.pub:ro \
    -v ./ssh_host_rsa_key.pub:/home/foo/.ssh/ssh_host_rsa_key.pub:ro \
    -v ./share:/home/foo \
    -p 9000:22 -d atmoz/sftp \
    foo::1001

 docker run \
    -v ./ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key \
    -v ./ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key \
    -v ./share:/home/foo \
    -p 9000:22 -d atmoz/sftp \
    foo::1001

    docker run \
    -v ./share:/home/foo \
    -p 9001:22 -d atmoz/sftp \
    foo::1001


   docker run \
  -p 22:22 -t -v ./data:/etc/ssh/ atmoz/sftp \
  user1:password1::1001 \
  user2:password2::1002


https://stackoverflow.com/questions/73365727/mounting-a-configmap-as-a-volume-in-kubernetes-how-do-i-calculate-the-value-of