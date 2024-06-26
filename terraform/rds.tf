module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.0.0"
  
  identifier = var.rds_identifier
  engine     = "mysql"
  engine_version    = "8.0"
  instance_class = "db.t3.micro"
  allocated_storage = 20

  allow_major_version_upgrade = true
  apply_immediately = true
  
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  manage_master_user_password = false

  iam_database_authentication_enabled = true
  
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  subnet_ids             = module.vpc.public_subnets

  major_engine_version = "8.0" 
  family               = "mysql8.0"

  create_db_subnet_group = true
  publicly_accessible    = true

  skip_final_snapshot = true
}

