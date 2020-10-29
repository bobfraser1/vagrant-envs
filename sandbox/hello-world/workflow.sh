tink workflow create \
  -t `tink template list | awk '/hello-world/ {print $2}'` \
  -r '{"device_1":"08:00:27:00:00:01"}'
