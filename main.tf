terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  key_name               = "bitroid"
  ami                    = "ami-0bc06212a56393ee1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-090c080efee992a15"]
  subnet_id              = "subnet-03b90f5f268b3c543"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    delete_on_termination = "true"
  }

  user_data_base64="IyEvYmluL2Jhc2gKeXVtIGluc3RhbGwgLXkgd2dldAp3Z2V0IC1PIGF6dXJlamVua2lucy5zaCBodHRwczovL2dpdC5pby9iaXRyb2lkamVua2luc2VjMiAmJiBzaCBhenVyZWplbmtpbnMuc2g="

}

output "Public_IP" {
  value = aws_instance.example.public_ip
}

output "Private_IP" {
  value = aws_instance.example.private_ip
}

output "Private_DNS" {
  value = aws_instance.example.private_dns
}
