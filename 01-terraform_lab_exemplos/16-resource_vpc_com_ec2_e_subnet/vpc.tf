resource "aws_vpc" "my_vpc" {
  cidr_block = "172.10.0.0/16"
  tags = {
    Name = "tf-lab-lucgabm"
  }
}

resource "aws_subnet" "my_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.10.10.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-lab-lucgabm-subnet_a"
  }
}

resource "aws_subnet" "my_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.10.20.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "tf-lab-lucgabm-subnet_b"
  }
}

resource "aws_subnet" "my_subnet_c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.10.30.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tf-lab-lucgabm-subnet_c"
  }
}


resource "aws_network_interface" "my_subnet_a" {
  subnet_id   = aws_subnet.my_subnet_a.id
  private_ips = ["172.10.10.101"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface my_subnet"
  }
}

resource "aws_network_interface" "my_subnet_b" {
  subnet_id   = aws_subnet.my_subnet_b.id
  private_ips = ["172.10.20.100"] # IP definido para instancia
  # security_groups = ["${aws_security_group.allow_ssh1.id}"]

  tags = {
    Name = "primary_network_interface my_subnet_b"
  }
}
