resource "oci_core_volume" "YaraBlockVolume01" {

    compartment_id = var.compartment_id
    availability_domain = "oXVt:ME-JEDDAH-1-AD-1"
    display_name = "YaraBlockVolume01"
    size_in_gbs = 50

}

resource "oci_core_volume_attachment" "YaraBVAttach01" {

    attachment_type = "paravirtualized"
    instance_id = oci_core_instance.YaraVM01.id
    volume_id = oci_core_volume.YaraBlockVolume01.id
    display_name = "YaraBVAttach01"
}

resource "oci_file_storage_file_system" "YaraFs01" {

    availability_domain = "oXVt:ME-JEDDAH-1-AD-1"
    compartment_id = var.compartment_id
    display_name = "YaraFs01"

}

resource "oci_file_storage_mount_target" "YaraMT01" {

    availability_domain = "oXVt:ME-JEDDAH-1-AD-1"
    compartment_id = var.compartment_id
    subnet_id = oci_core_subnet.YaraSubnet_Pub01.id
    display_name = "YaraMT01"

}

resource "oci_file_storage_export" "YaraExp01" {

    export_set_id = oci_file_storage_mount_target.YaraMT01.export_set_id
    file_system_id = oci_file_storage_file_system.YaraFs01.id
    path = "/yara-fs"

}