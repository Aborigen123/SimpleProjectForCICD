echo 'WORKIGN'
sudo systemctl stop simple-deploy-project.service
if pgrep -x "dotnet" > /dev/null
then
killall dotnet
fi
cd /home/SimpleProjectForCICD
git pull
cd /home/SimpleProjectForCICD/DeploySimpleProjectOnServer
dotnet build
sudo systemctl start simple-deploy-project.service
