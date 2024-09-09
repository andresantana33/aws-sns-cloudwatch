locals {
  env = terraform.workspace
  tags = {
    env = local.env
  }
}

data "aws_sns_topic" "selected" {
  name = var.sns_topic_name
}

#--------------------------------------
# ## Metric alarm - CPU Utilization
#--------------------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each            = toset(var.instance_ids)
  alarm_name          = "${var.alarm_name_prefix}-${each.value}-CPU-Utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Alarm if CPU utilization exceeds threshold"
  actions_enabled     = true

  dimensions = {
    InstanceId = each.value
  }

  alarm_actions = [data.aws_sns_topic.selected.arn]

  tags = {
    env = local.env
  }
}

#--------------------------------------
# ## Metric alarm - Memory Utilization
#--------------------------------------
resource "aws_cloudwatch_metric_alarm" "memory_utilization" {
  for_each            = toset(var.instance_ids)
  alarm_name          = "${var.alarm_name_prefix}-${each.value}-Memory-Utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "MemoryUtilization"
  namespace           = "CustomMetrics"
  period              = var.period
  statistic           = "Average"
  threshold           = var.memory_threshold
  alarm_description   = "Alarm if memory utilization exceeds threshold"
  actions_enabled     = true

  dimensions = {
    InstanceId = each.value
  }

  alarm_actions = [data.aws_sns_topic.selected.arn]

  tags = {
    env = local.env
  }
}

#--------------------------------------
# ## Metric alarm - Disk Utilization
#--------------------------------------
resource "aws_cloudwatch_metric_alarm" "disk_utilization" {
  for_each            = toset(var.instance_ids)
  alarm_name          = "${var.alarm_name_prefix}-${each.value}-Disk-Utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "DiskUtilization"
  namespace           = "CustomMetrics"
  period              = var.period
  statistic           = "Average"
  threshold           = var.disk_threshold
  alarm_description   = "Alarm if disk utilization exceeds threshold"
  actions_enabled     = true

  dimensions = {
    InstanceId = each.value
  }

  alarm_actions = [data.aws_sns_topic.selected.arn]

  tags = {
    env = local.env
  }
}

#--------------------------------------
# ## Metric alarm - Status Check Failed
#--------------------------------------
resource "aws_cloudwatch_metric_alarm" "status_check_failed" {
  for_each            = toset(var.instance_ids)
  alarm_name          = "${var.alarm_name_prefix}-${each.value}-Status-Check-Failed"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Minimum"
  threshold           = var.status_check_threshold
  alarm_description   = "Alarm if status check fails"
  actions_enabled     = true

  dimensions = {
    InstanceId = each.value
  }

  alarm_actions = [data.aws_sns_topic.selected.arn]

  tags = {
    env = local.env
  }
}
