variable "AWS_REGION" {
  default = "ap-northeast-1"
}

variable AWS_ACCESS_KEY {
  default = ""
}

variable AWS_SECRET_KEY {
  default = ""
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "user02-key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "user02-key.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0b6eafddaa44ab1ae"
    ap-northeast-1 = "ami-0f9af249e7fa6f61b"
  }
}
