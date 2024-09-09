locals {
  env = terraform.workspace
  tags = {
    env = local.env
  }
}

#-------------------
## SNS_Topic
#-------------------
module "sns_topic" {
  source = "terraform-aws-modules/sns/aws"

  for_each = var.sns_topic_config

  name         = each.value.name
  display_name = each.value.display_name

  tags = {
    env = local.env
  }
}

#-------------------------
## SNS_Topic_Subscription
#-------------------------
resource "aws_sns_topic_subscription" "email_subscriptions" {
  for_each = var.sns_topic_subscription_email

  topic_arn = module.sns_topic[each.value.topic_name].topic_arn
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint
}