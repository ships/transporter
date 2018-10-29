variable "system_domain" {
  type = "string"
}

resource "google_compute_firewall" "vpn-server-allow-connection" {
  name    = "transporter-room-vpn-allow"
  network = "${google_compute_network.bbl-network.name}"

  source_ranges = ["0.0.0.0/0"]

  allow {
    ports    = ["1194"]
    protocol = "tcp"
  }

  target_tags = ["vpn","server"]
}

resource "google_compute_address" "vpn-ip" {
  name = "transporter-room-vpn-ip"
}

resource "google_dns_record_set" "vpn-frontend" {
  name = "vpn.${var.system_domain}."
  type = "A"
  ttl  = 300

  managed_zone = "haut-kultur-org-root"

  rrdatas = ["${google_compute_address.vpn-ip.address}"]
}

output "vpn_external_ip" {
  value = "${google_compute_address.vpn-ip.address}"
}
