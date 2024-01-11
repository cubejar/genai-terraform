resource "aws_docdb_cluster" "example" {
  cluster_identifier        = var.cluster_identifier
  master_username           = var.master_username
  master_password           = var.master_password
  engine                    = "docdb"
  engine_version            = "4.0.0"
  availability_zones        = ["us-west-2a", "us-west-2b"] 
  preferred_maintenance_window = "sun:05:00-sun:06:00"
  backup_retention_period   = 7
  apply_immediately         = true
  storage_encrypted         = true
  db_subnet_group_name      = aws_db_subnet_group.example.name
}

resource "aws_db_subnet_group" "example" {
  name       = "example"
  subnet_ids = ["subnet-xxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyy"]  # Replace with your subnet IDs
}

