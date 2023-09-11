resource "aws_sns_topic" "billing_alert" {
  name = "BillingAlert"
}

resource "aws_sns_topic_subscription" "billing_alert_email" {
  topic_arn = aws_sns_topic.billing_alert.arn
  protocol  = "email"
  endpoint  = "me@steveparson.ca"
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = "EstimatedChargesExceeds15"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  threshold           = "15"
  alarm_description   = "Alarm when AWS charges exceed $15"
  alarm_actions       = [aws_sns_topic.billing_alert.arn]

  dimensions = {
    Currency = "CAD"
  }
}
