resource "aws_db_instance" "prouni_rds" {
  identifier             = "prounidb"
  allocated_storage      = 200
  engine                 = "mysql"
  engine_version         = "5.7.38"
  instance_class         = "db.m5.xlarge"
  username               = "admin"
  password               = "mypassword"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = true                             # demo, not for use in production
  db_subnet_group_name   = aws_db_subnet_group.default.name # "default-vpc-00901260907d4792a"
  vpc_security_group_ids = [aws_security_group.demo.id]
}