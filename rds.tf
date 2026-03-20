########################
# RDS Security Group
########################

resource "aws_security_group" "rds_sg" {
  name = "showgo-rds-sg"

  ingress {
    description     = "Allow EC2 to access RDS"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################
# RDS PostgreSQL
########################

resource "aws_db_instance" "showgo_db" {

  identifier = "showgodb"

  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.t4g.micro"

  allocated_storage = 20

  db_name  = "postgres"
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "showgo-db"
  }
}