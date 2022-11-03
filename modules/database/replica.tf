resource "aws_db_instance" "rds_replica" {
  identifier             = "rds-replica"
  replicate_source_db    = aws_db_instance.rds.identifier
  instance_class         = var.instance_class
  apply_immediately      = true
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [data.aws_security_group.rds_sg.id]
}