resource "local_file" "sql_ps1" {
  content = templatefile("scripts/sql.ps1.tmpl", {
    admin_user               = var.admin_user
    admin_password           = var.admin_password
    resourceGroup            = var.resourceGroup
    location                 = var.location
    servicePrincipalAppId    = var.servicePrincipalAppId
    servicePrincipalSecret   = var.servicePrincipalSecret
    servicePrincipalTenantId = var.servicePrincipalTenantId
    }
  )
  filename = "scripts/sql.ps1"
}

resource "local_file" "install_arc_agent_ps1" {
  content = templatefile("scripts/install_arc_agent.ps1.tmpl", {
    resourceGroup            = var.resourceGroup
    location                 = var.location
    subId                    = var.subId
    servicePrincipalAppId    = var.servicePrincipalAppId
    servicePrincipalSecret   = var.servicePrincipalSecret
    servicePrincipalTenantId = var.servicePrincipalTenantId
    }
  )
  filename = "scripts/install_arc_agent.ps1"
}

resource "null_resource" "web" {
  provisioner "file" {
    source      = "scripts/install_arc_agent.ps1"
    destination = "C:/tmp/install_arc_agent.ps1"

    connection {
      type     = "winrm"
      host     = var.Ipaddress
      port     = 5985
      user     = var.admin_user
      password = var.admin_password
      https    = false
      insecure = true
      timeout  = "10m"
    }
  }

  provisioner "file" {
    source      = "scripts/sql.ps1"
    destination = "C:/tmp/sql.ps1"

    connection {
      type     = "winrm"
      host     = var.Ipaddress
      port     = 5985
      user     = var.admin_user
      password = var.admin_password
      https    = false
      insecure = true
      timeout  = "10m"
    }
  }

  provisioner "file" {
    source      = "scripts/restore_db.ps1"
    destination = "C:/tmp/restore_db.ps1"

    connection {
      type     = "winrm"
      host     = var.Ipaddress
      port     = 5985
      user     = var.admin_user
      password = var.admin_password
      https    = false
      insecure = true
      timeout  = "10m"
    }
  }

  provisioner "file" {
    source      = "scripts/mma.json"
    destination = "C:/tmp/mma.json"

    connection {
      type     = "winrm"
      host     = var.Ipaddress
      port     = 5985
      user     = var.admin_user
      password = var.admin_password
      https    = false
      insecure = true
      timeout  = "10m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "powershell.exe -File C://tmp//sql.ps1",
      "powershell.exe -File C://tmp//install_arc_agent.ps1"

    ]

    connection {
      type     = "winrm"
      host     = var.Ipaddress
      port     = 5985
      user     = var.admin_user
      password = var.admin_password
      https    = false
      insecure = true
      timeout  = "10m"
    }
  }
}

output "public_ip" {
  value = var.Ipaddress
}
