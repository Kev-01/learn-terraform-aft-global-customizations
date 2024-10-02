resource "aws_iam_instance_profile" "ec2_ssm_role" {
  name = "ec2_ssm_profile"
  role = aws_iam_role.ec2_role.name
}



resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
