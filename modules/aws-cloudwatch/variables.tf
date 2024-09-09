#-------------------
# CloudWatch EC2
#-------------------
variable "region" {
  description = "environment region"
  type        = string
}

variable "sns_topic_name" {
  description = "Nome do SNS Topic para alarmes"
  type        = string
}

variable "instance_ids" {
  description = "List of EC2 instance IDs"
  type        = list(string)
}

variable "alarm_name_prefix" {
  description = "Prefix for the alarm names"
  type        = string
  default     = "EC2Instance"
}

variable "evaluation_periods" {
  description = "Limite de utilização de evaluation para alarmes"
  type        = number
}

variable "period" {
  description = "Limite de utilização de periodo para alarmes"
  type        = number
}

variable "cpu_threshold" {
  description = "Limite de utilização de cpu para alarmes"
  type        = number
}

variable "memory_threshold" {
  description = "Limite de utilização de memoria para alarmes"
  type        = number
}

variable "disk_threshold" {
  description = "Limite de utilização de disco para alarmes"
  type        = number
}

variable "status_check_threshold" {
  description = "Limite de utilização de status para alarmes"
  type        = number
}

#-------------------
# CloudWatch RDS
#-------------------
variable "db_instance_ids" {
  description = "List of RDS instance IDs"
  type        = list(string)
}


variable "rds_evaluation_periods" {
  description = "Limite de utilização de evaluation para alarmes"
  type        = number
}

variable "rds_period" {
  description = "Limite de utilização de periodo para alarmes"
  type        = number
}

variable "rds_alarm_name_prefix" {
  description = "Prefix for the alarm names"
  type        = string
  default     = "DBInstance"
}

variable "rds_cpu_threshold" {
  description = "Limite de utilização de cpu para alarmes"
  type        = number
}

variable "rds_memory_threshold" {
  description = "Limite de utilização de memoria para alarmes"
  type        = number
}

variable "rds_storage_threshold" {
  description = "Limite de utilização de disco para alarmes"
  type        = number
}

variable "rds_connection_threshold" {
  description = "Limite de utilização de status para alarmes"
  type        = number
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state."
  type        = list(string)
  default     = []
}





