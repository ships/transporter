credhub generate \
  -n "/pki/identities/${1}" \
  -t certificate \
  --ca /root_ca \
  -c "Transporter Leaf Identity - ${1}" \
  -o "haut kultur group" \
  -g key_agreement \
  -g digital_signature \
  -e client_auth
