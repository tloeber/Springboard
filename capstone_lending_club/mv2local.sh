# Requirements: Instance must be running

# Get public DNS address of ec2 instance 
dns=$(aws ec2 describe-instances --profile lending_club | jq -r '. | .Reservations[0].Instances[0].PublicDnsName')

# Move current local version to folder "old" before overwriting it
mv ~/Desktop/projects/Springboard/capstone_lending_club/2c_modeling_AWS_1.ipynb ~/Desktop/projects/Springboard/capstone_lending_club/old/2c_modeling_AWS_1.ipynb 

# Copy file from instance to local computer
scp -i ~/.ssh/lending_club_2.pem ubuntu@$dns:~/Notebooks/2c_modeling_AWS_1.ipynb ~/Desktop/projects/Springboard/capstone_lending_club/2c_modeling_AWS_1.ipynb 