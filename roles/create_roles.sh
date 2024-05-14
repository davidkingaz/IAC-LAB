#!/bin/bash

# List of NetBox modules
modules=(
    "netbox_aggregate"
    "netbox_asn"
    "netbox_cable"
    "netbox_circuit"
    "netbox_circuit_termination"
    "netbox_circuit_type"
    "netbox_cluster"
    "netbox_cluster_group"
    "netbox_cluster_type"
    "netbox_config_context"
    "netbox_config_template"
    "netbox_console_port"
    "netbox_console_port_template"
    "netbox_console_server_port"
    "netbox_console_server_port_template"
    "netbox_contact"
    "netbox_contact_group"
    "netbox_contact_role"
    "netbox_custom_field"
    "netbox_custom_link"
    "netbox_device"
    "netbox_device_bay"
    "netbox_device_bay_template"
    "netbox_device_interface"
    "netbox_device_interface_template"
    "netbox_device_role"
    "netbox_device_type"
    "netbox_export_template"
    "netbox_fhrp_group"
    "netbox_fhrp_group_assignment"
    "netbox_front_port"
    "netbox_front_port_template"
    "netbox_inventory_item"
    "netbox_inventory_item_role"
    "netbox_ip_address"
    "netbox_ipam_role"
    "netbox_journal_entry"
    "netbox_l2vpn"
    "netbox_l2vpn_termination"
    "netbox_location"
    "netbox_manufacturer"
    "netbox_module_type"
    "netbox_platform"
    "netbox_power_feed"
    "netbox_power_outlet"
    "netbox_power_outlet_template"
    "netbox_power_panel"
    "netbox_power_port"
    "netbox_power_port_template"
    "netbox_prefix"
    "netbox_provider"
    "netbox_provider_network"
    "netbox_rack"
    "netbox_rack_group"
    "netbox_rack_role"
    "netbox_rear_port"
    "netbox_rear_port_template"
    "netbox_region"
    "netbox_rir"
    "netbox_route_target"
    "netbox_service"
    "netbox_service_template"
    "netbox_site"
    "netbox_site_group"
    "netbox_tag"
    "netbox_tenant"
    "netbox_tenant_group"
    "netbox_virtual_chassis"
    "netbox_virtual_machine"
    "netbox_vlan"
    "netbox_vlan_group"
    "netbox_vm_interface"
    "netbox_vrf"
    "netbox_webhook"
    "netbox_wireless_lan"
    "netbox_wireless_lan_group"
    "netbox_wireless_link"
)

# Create directories and main.yml for each module
for module in "${modules[@]}"; do
    # Directory structure
    mkdir -p "$module/tasks"

    # Create a basic main.yml file
    cat <<EOT > "$module/tasks/main.yaml"
---
- name: Configure $module in NETBOX
  netbox.netbox.$module:
    netbox_url: "{{ netbox_url }}"
    netbox_token: "{{ obtained_token }}"
    data:
      # Add specific module parameters here
    state: present # or absent
  # Add other necessary parameters here
EOT

    echo "Created directory and task file for $module"
done

echo "All module directories and main.yml files have been created."
