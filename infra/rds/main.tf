variable "db_subnet_group_name" {}
variable "subnet_groups" {}
variable "rds_mysql_sg_id" {}
variable "mysql_db_identifier" {}
variable "mysql_username" {}
variable "mysql_password" {}
variable "mysql_dbname" {}

# RDS Subnet Group
resource "aws_db_subnet_group" "dev_proje_1_db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_groups # public subnet
}

resource "aws_db_instance" "default" {
  allocated_storage       = 10
  storage_type            = "gp2"
  engine                  = "mysql" //  the database engine
  engine_version          = "5.7"
  instance_class          = "db.t2.micro" 
  identifier              = var.mysql_db_identifier // name of the RDS instance
  username                = var.mysql_username
  password                = var.mysql_password // Password for the master DB user
  vpc_security_group_ids  = [var.rds_mysql_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.dev_proje_1_db_subnet_group.name
  db_name                 = var.mysql_dbname
  skip_final_snapshot     = true //  Determines whether a final DB snapshot is created before the DB instance is deleted. 
  apply_immediately       = true // Specifies whether any database modifications are applied immediately, or during the next maintenance window
  backup_retention_period = 0
  deletion_protection     = false // The database can't be deleted when this value is set to true
}

