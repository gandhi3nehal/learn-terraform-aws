provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_instance_profile" "example_profile" {
  name = "example_profile"
  role = aws_iam_role.example_role.name
}

resource "aws_instance" "example_instance" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  
  iam_instance_profile = aws_iam_instance_profile.example_profile.name

  tags = {
    Name = "exampleinstance"
  }
}
