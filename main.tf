provider "aws" {
  region = "us-east-1" 
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

resource "aws_instance" "web" {
  ami           = "ami-05548f9cecf47b442"  
  instance_type = "t2.micro"  
  key_name      = "my-sre-app"  

  tags = {
    Name = "DevopsNLP"
  }

  security_groups = [
    aws_security_group.web.id
  ]

  subnet_id = aws_subnet.public.id 
}

resource "aws_security_group" "web" {
  name_prefix = "web-sg-"
  description = "Security group for the web server"
  vpc_id      = aws_vpc.main.id  

  ingress {
    from_port   = 80 
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"  
  availability_zone = "us-east-1a"  
}
