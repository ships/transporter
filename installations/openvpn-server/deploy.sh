#!/bin/bash -ex

this_dir="${REPO_ROOT}/installations/openvpn-server"

if [ ! -f "${this_dir}/variables.yml" ]; then
	cat > "${this_dir}/variables.yml" <<VARS
system_domain: ${system_domain}
vpn_ip_from_bbl: $(dig +short "vpn.${system_domain}")
virtual_network:
  server_ip: 10.168.0.1
  start_ip: 10.168.0.0
  netmask: 255.255.255.0
dh_pem: "$(openssl dhparam -text -outform PEM 2>/dev/null | awk '/BEGIN/{p=1}p')"
VARS
fi

bosh deploy $REPO_ROOT/installations/openvpn-server/manifest.yml \
  -d vpn \
  -o $REPO_ROOT/installations/openvpn-server/iptables-forward-rules.yml \
  --vars-file $REPO_ROOT/installations/openvpn-server/variables.yml
