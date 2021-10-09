#!/bin/bash
# curl -LO https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json
curl -LO http://mesh-svc:8001/openapi/v2
# sed -i -e '$d' swagger.json
# sed -i -e '$d' swagger.json
# cat << EOF >> swagger.json
#   "swagger": "2.0",
#   "servers": [
#     { "url": "http://mesh-svc:8001/"}
#   ]
# }
# EOF
# sed -i -e "s/\(\s\{10,\}\)\"https/\1\"http/g"  swagger.json
sleep 3600