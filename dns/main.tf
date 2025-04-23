data "github_ip_ranges" "this" {}

locals {
  txt_challenges = [
    { record_name : "_acme-challenge", record_value : "5zj3Pr2eRPPyw5S4euvnZ98qubjcLqAbO2aEz53h-lo", },
    { record_name : "_acme-challenge", record_value : "5VV_XGcGHlA8m3Eg2xODf0YLr2FealenncWLEB6a2Hk", },
    { record_name : "_acme-challenge", record_value : "NJZu_dPxwNqbliE8sUiQ4qcIzzPHFk7IiPIr_3gXd9o", },
    { record_name : "_acme-challenge", record_value : "C30lQ5JRtgXzqctmzk9aK5AgiuYYPSAjnt6-J0cZ1GQ", },
    { record_name : "_acme-challenge.www", record_value : "2eAi2LfAqe2kZD1exDz4YJz2PnlwznNBz-FDOSV3e4c", },
    { record_name : "_acme-challenge.www", record_value : "ztNqyaS4r9atH4FaWb3CMpCWTmXnH7xyJ276LzklQpQ", },
    { record_name : "_acme-challenge.www", record_value : "MQl-hplvzWNmkqOF4l3_ntOzBOYAKjNj_Tamn3Endtg", },
    { record_name : "_acme-challenge.www", record_value : "TEJuZs7UoIaRFrylsCKW9wtsP-ICR8li7zD8wCCHPeM", },
  ]
}
