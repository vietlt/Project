resource "aws_db_instance" "rds" {
  identifier              = "rds"
  instance_class          = var.instance_class
  allocated_storage       = var.storage
  apply_immediately       = true
  engine                  = var.engine
  engine_version          = var.engine_version
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.subnetgroup.name
  vpc_security_group_ids  = [data.aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  backup_retention_period = 1
}