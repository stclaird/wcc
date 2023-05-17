
resource "aws_instance" "ssm" {
  ami           = var.ssm_ami
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  key_name = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [
    aws_security_group.ssm.id
  ]
 
  subnet_id = var.ssm_subnet_id

  tags = {
    Name = "${var.name} SSM Bastion"
  }
}

resource "aws_security_group" "ssm" {
  name        = "SSM Bastion"
  description = "Allow SSM Traffic"
  vpc_id      = var.vpc_id
  ingress {
    description      = "SSH"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["172.17.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SSM"
  }
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-bastion-profile"
  role = aws_iam_role.ssm_role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ssm_role" {
  name               = "ssm-bastion-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ssm-attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}