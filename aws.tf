resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "example-igw"
  }
}

resource "aws_subnet" "example" {
  vpc_id = aws_vpc.example.id
  cidr_block =  "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "example-Subnet"
  }
}

resource "aws_security_group" "example" {
  name = "example"
  description = "Example Security group"
  vpc_id = aws_vpc.example.id

  ingress = {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "example" {
  key_name = "example-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "example" {
  ami = "ami-089c5f630e96948cb"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.example.id

  vpc_security_group_ids = [aws_security_group.example.id]

  key_name = aws_key_pair.example.key_name

  tags = {
    Name = "Example Instance"
  }
}