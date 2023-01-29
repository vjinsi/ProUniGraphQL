resource "aws_security_group" "demo" {
  name        = "demo"
  description = "Allow all traffic (demo, not for production)"
  vpc_id      = aws_vpc.main.id #"vpc-00901260907d4792a"

  ingress {
    description      = "All ingress (demo, not for production)"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
