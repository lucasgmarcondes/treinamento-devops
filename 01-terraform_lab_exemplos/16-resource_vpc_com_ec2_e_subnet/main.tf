provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "dev-lucgabm-tf"          # key chave publica cadastrada na AWS 
  subnet_id     = aws_subnet.my_subnet_c.id # vincula a subnet direto e gera o IP automático
  root_block_device {
    encrypted   = true
    volume_size = 20
  }
  tags = {
    Name = "ec2_lucgabm_tf"
  }

  # network_interface {
  #   network_interface_id = aws_network_interface.my_subnet_a.id # vincula a subnet com ip fixo
  #   device_index         = 0                                    # DeviceIndex - The network interface's position in the attachment order. For example, the first attached network interface has a DeviceIndex of 0. 
  # }
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "dev-lucgabm-tf"
  root_block_device {
    encrypted   = true
    volume_size = 20
  }
  tags = {
    Name = "ec2_lucgabm_tf01"
  }

  network_interface {
    network_interface_id = aws_network_interface.my_subnet_b.id # vincula a subnet com ip fixo
    device_index         = 0
  }
}
