# Requirements: jq. Instance must be running and Jupyter notebook started.

# Get public DNS address
dns=$(aws ec2 describe-instances --profile lending_club | jq -r '. | .Reservations[0].Instances[0].PublicDnsName')

# Set up port forwarding for Jupyter notebook
ssh -i ~/.ssh/lending_club_2.pem -L 8000:localhost:8888 ubuntu@$dns

# Keep command prompt open
# $SHELL