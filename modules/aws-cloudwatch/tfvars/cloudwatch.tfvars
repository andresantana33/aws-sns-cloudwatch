#-------------------
# Region
#-------------------
region = "us-east-1"
sns_topic_name = "sns-topic-infra"
#--------------------
# CloudWatch
#--------------------
instance_ids = ["i-0bf2021dc9834fe93"]
  alarm_name_prefix = "Instance EC2"
  evaluation_periods = 5
  period = 300
  cpu_threshold = 80
  memory_threshold = 80
  disk_threshold = 80
  status_check_threshold = 1

  
 
