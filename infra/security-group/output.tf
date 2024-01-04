output "security_group" {
  value = {
    bastion_id      = aws_security_group.bastion.id
    bastion_arn     = aws_security_group.bastion.arn
    rds_id          = aws_security_group.rds.id
    rds_arn         = aws_security_group.rds.arn
    elasticache_id  = aws_security_group.elasticache.id
    elasticache_arn = aws_security_group.elasticache.arn
  }
}