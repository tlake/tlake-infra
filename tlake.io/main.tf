resource dnsimple_record blog_tlake_io {
  domain = var.dnsimple_domain
  name   = "blog"
  value  = var.porkbun_ip_address
  type   = "A"
  ttl    = 3600
}

resource dnsimple_record email_tlake_io {
  domain = var.dnsimple_domain
  name   = "email"
  value  = var.porkbun_ip_address
  type   = "A"
  ttl    = 3600
}

resource dnsimple_record mc_tlake_io {
  domain = var.dnsimple_domain
  name   = "mc"
  value  = var.home_ip_address
  type   = "A"
  ttl    = 3600
}

resource dnsimple_record minecraft_tlake_io {
  domain = var.dnsimple_domain
  name   = "minecraft"
  value  = var.home_ip_address
  type   = "A"
  ttl    = 3600
}

resource dnsimple_record cloud_tlake_io {
  domain = var.dnsimple_domain
  name   = "cloud"
  value  = var.home_ip_address
  type   = "A"
  ttl    = 3600
}

resource dnsimple_record alias_tlake_io {
  domain = var.dnsimple_domain
  name   = ""
  value  = "tlake.github.io"
  type   = "ALIAS"
  ttl    = 3600
}

resource dnsimple_record www_tlake_io {
  domain = var.dnsimple_domain
  name   = "www"
  value  = "tlake.io"
  type   = "CNAME"
  ttl    = 3600
}

resource dnsimple_record alias_txt_tlake_io {
  domain = var.dnsimple_domain
  name   = ""
  value  = "ALIAS for tlake.github.io"
  type   = "TXT"
  ttl    = 3600
}

resource dnsimple_record challenge1_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge"
  value  = "5zj3Pr2eRPPyw5S4euvnZ98qubjcLqAbO2aEz53h-lo"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge2_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge"
  value  = "5VV_XGcGHlA8m3Eg2xODf0YLr2FealenncWLEB6a2Hk"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge3_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge"
  value  = "NJZu_dPxwNqbliE8sUiQ4qcIzzPHFk7IiPIr_3gXd9o"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge4_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge"
  value  = "C30lQ5JRtgXzqctmzk9aK5AgiuYYPSAjnt6-J0cZ1GQ"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge5_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge.www"
  value  = "2eAi2LfAqe2kZD1exDz4YJz2PnlwznNBz-FDOSV3e4c"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge6_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge.www"
  value  = "ztNqyaS4r9atH4FaWb3CMpCWTmXnH7xyJ276LzklQpQ"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge7_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge.www"
  value  = "MQl-hplvzWNmkqOF4l3_ntOzBOYAKjNj_Tamn3Endtg"
  type   = "TXT"
  ttl    = 1
}

resource dnsimple_record challenge8_tlake_io {
  domain = var.dnsimple_domain
  name   = "_acme-challenge.www"
  value  = "TEJuZs7UoIaRFrylsCKW9wtsP-ICR8li7zD8wCCHPeM"
  type   = "TXT"
  ttl    = 1
}

