# Requirements: jq

# Get instance ID ("-r" gives raw string without quotes)
instance_id=$(aws ec2 describe-instances --profile lending_club | jq -r '. | .Reservations[0].Instances[0].InstanceId')

# Get public DNS address
dns=$(aws ec2 describe-instances --profile lending_club | jq -r '. | .Reservations[0].Instances[0].PublicDnsName')

# Start instance
aws ec2 start-instances --instance-id=$instance_id --profile lending_club

# ssh into instance (skip confirmation)
ssh -i ~/.ssh/lending_club_2.pem ubuntu@$dns -o "StrictHostKeyChecking no" 

# Keep terminal window open
$SHELL