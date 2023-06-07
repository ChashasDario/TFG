/*
apiVersion: v1
kind: Service
metadata:
  annotations:
    cloud.google.com/neg: '{"ingress":true}'
  creationTimestamp: "2023-06-07T00:05:39Z"
  finalizers:
  - service.kubernetes.io/load-balancer-cleanup
  generateName: wordpress-deployment-998b89757-txzsh-
  labels:
    app: wordpress
    pod-template-hash: 998b89757
    type: frontend
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:generateName: {}
        f:labels:
          .: {}
          f:app: {}
          f:pod-template-hash: {}
          f:type: {}
      f:spec:
        f:allocateLoadBalancerNodePorts: {}
        f:externalTrafficPolicy: {}
        f:internalTrafficPolicy: {}
        f:ports:
          .: {}
          k:{"port":80,"protocol":"TCP"}:
            .: {}
            f:port: {}
            f:protocol: {}
            f:targetPort: {}
        f:selector: {}
        f:sessionAffinity: {}
        f:type: {}
    manager: GoogleCloudConsole
    operation: Update
    time: "2023-06-07T00:05:38Z"
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:finalizers:
          .: {}
          v:"service.kubernetes.io/load-balancer-cleanup": {}
    manager: kube-controller-manager
    operation: Update
    subresource: status
    time: "2023-06-07T00:05:39Z"
  name: wordpress-deployment-998b89757-txzsh-jngtr
  namespace: default
  resourceVersion: "6186"
  uid: a67eca14-3c76-44f8-8b29-d4db7cbb210d
spec:
  allocateLoadBalancerNodePorts: true
  clusterIP: 10.141.3.100
  clusterIPs:
  - 10.141.3.100
  externalTrafficPolicy: Cluster
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - nodePort: 31960
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: wordpress
    pod-template-hash: 998b89757
    type: frontend
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
*/