data "aws_vpc" "default" {
  default = true
}

# Get all subnets from the default VPC
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

output "default_subnet_ids" {
  value = data.aws_subnets.default_subnets.ids[0]
}

# Create a new SSH Key Pair and store the private key locally
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-ec2-key-pair"   # The name of the key pair
  public_key = file("./ssh-keys/terraform_public_key.pub") # Path to your existing public key file

  tags = {
    Name = "MyEC2KeyPair"
  }
}


resource "aws_instance" "master_node" {
  count = 2
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t3.medium"
  key_name = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.masternode_sg.id]
  associate_public_ip_address = true
  subnet_id = data.aws_subnets.default_subnets.ids[0]

  user_data = <<-EOF
    #cloud-config
    hostname: ${count.index == 0 ? "master" : "node0${count.index}"}
  EOF

tags = {
    Name = count.index == 0 ? "master" : "node0${count.index}"
  }

}


output "public_ip" { 
  value = aws_instance.master_node.*.public_ip
  
}