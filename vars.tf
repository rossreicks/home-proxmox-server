variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKxykDlKJ7MtN0NLZeBaj1132K9CmcX+hnL3atY9N6ZqdQUHu1vLGad6UvWAftmE3b19ZNSSECPhIPyPH1amQrH9J0Z6ayBBev4PHzLk3zf66kwt8lowC8QBIU5oaVUCC1Lq/EndcP8XGrPT3euMfnzjsPR/Zx8Dw8XNisLiSycLTips2O7lmRIc3JKYI6vCAsTi+Y99Dt4QKl2XJYqfk056YAapaNoB66pkkrphVVgyux1faPGaARcp43OdBLI6rSW1UQ+mHnrkJdvrCxPJf2CdNlzzno25ijkL6USueyCLJwOz5oSzwc3W5v091HD1DpZI7S7VZUNheYOekg9bs3gLjrBGO3TZDLlcT1J3U6sSepdL0U81rXIppL1vBA2CRMAEyBDLbRAJh3rhIYRlVAcC9E74ki//U3l/w1LwiINSHwr1bS3PaAURILApSNYmX/utWnSfsfW/v7u8zwj4JR49LrQBZE1ZoYjvYw7PBXf+stnq2FFra5cWvLaeMgpT5EMBtbPO6/wWUT7Z+cgPxXG8tz6KVsy5Bld6sXbCMljaayXbakwUbXs1lsIEFhw/NE4tNioTuMmcvJi13Lsc0XfZNfc+0x3rr2/k0nH0IIDkLNi11uQZ1aAe71ednRdNYZ3/KdQqhX7zwWTOnJjIorlJfDcxSbBcQxSOiaF/eREw== ross@Rosss-MacBook-Pro.local"
}
variable "proxmox_host" {
    default = "rossreicks"
}
variable "template_name" {
    default = "ubuntu-cloudinit-template"
}
