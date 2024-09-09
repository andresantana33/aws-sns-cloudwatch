#--------------------
# Region
#--------------------
region = "us-east-1"

#--------------------
# Module SNS
#--------------------
sns_topic_config = {
  sns-topic-prod = {
    name         = "sns-topic-infra"
    display_name = "sns-topic-infra"
  }
}

sns_topic_subscription_email = {
  sns-topic-subscription-email-1 = {
    topic_name = "sns-topic-prod"
    protocol   = "email"
    endpoint   = "andre.santana@e-core.com"
 }
  
}



