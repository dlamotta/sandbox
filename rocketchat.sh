# Use this file to start an ephemeral instance of Rocket.Chat in your OpenShift environment

git clone https://github.com/RocketChat/Rocket.Chat
cd Rocket.Chat

oc new-project ntc
oc create -f .openshift/rocket-chat-ephemeral.json
oc new-app --name chat --template=rocket-chat-ephemeral -p MONGODB_DATABASE=rocketchat -p MONGODB_USER=rocketchat-admin -p MONGODB_PASSWORD=rocketchat 
oc import-image rocketchat --confirm
oc rollout latest chat

