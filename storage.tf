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