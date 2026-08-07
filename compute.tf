resource "oci_core_instance" "YaraVM01" {

    availability_domain = "oXVt:ME-JEDDAH-1-AD-1"
    compartment_id = var.compartment_id
    display_name = "YaraVM01"
    shape = "VM.Standard.A1.Flex"

    shape_config {

    ocpus         = 1
    memory_in_gbs = 6

    }

    source_details {

        source_id = "ocid1.image.oc1.me-jeddah-1.aaaaaaaatcefj2cvfk62gormbaeksf5ok52k4p3w4v76pl5vcdtdq5nohukq"
        source_type = "image"

    }

    create_vnic_details {

        subnet_id = oci_core_subnet.YaraSubnet_Pub01.id
        assign_public_ip = true

    }

    metadata = {

        ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBtJPLcIm8T/R1/Gl1t9NjrTIBgiof7abPqYY5mNeXmMP4PW34Cl5Nn9+W28rjvlheROLllUQQ7r+RMnYt3ewKpEKuk51UyAmW9y6WhrqWz2p/MpGp2qA0Bk/ICtAVUoEaolLn2YL4yBoI+WsVO9ZjjS3Ha4WxNfqEJTwuqKgcb3GWpbmLMkGMofKY6uEnbbKPcAscZmBsrCjqgi/ErX9wDou523Ba17FOpTjWObiUtcwKMRlUvRlUe/BiFyl6WyovAKK9qqPnGuHu0Q7s+WlSAfhgj4ANuxK39EPEJJXldkvlMpjmgT2FIEwq4gXZ4r69x3GsfxhCXzf/zfgO5L1p yaraa@Yuri"
    }

}