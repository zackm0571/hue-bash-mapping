#!/bin/bash 
export HUE_BRIDGE_IP=http://192.168.1.151/
export BASE_API=http://192.168.1.151/api
export USER=8LKcg4w717ugIGKYQKyWOkAX9bS0L254d-DPE1Ik
export CONTENT_JSON="Content-Type: application/json"
create-user() {
	curl $BASE_API/ -H "Content-Type: application/json" -X POST -d '{"devicetype":"home#${$1}"}' | jq .
} 

get-info(){
	curl $BASE_API/$USER | jq .
}
get-lights(){
	curl $BASE_API/$USER/lights | jq .
}

turn-on(){
	curl $BASE_API/$USER/lights/$1/state -H CONTENT_JSON -X PUT -d '{"on":true}' | jq .
}
turn-off(){
	curl $BASE_API/$USER/lights/$1/state -H CONTENT_JSON -X PUT -d '{"on":false}' | jq .
}
start-color-loop(){
	curl $BASE_API/$USER/lights/$1/state -H CONTENT_JSON -X PUT -d '{"on":true, "effect":"colorloop"}' | jq .
}
end-color-loop(){
	curl $BASE_API/$USER/lights/$1/state -H CONTENT_JSON -X PUT -d '{"on":true, "effect":"none"}' | jq .
}
get-sensors(){
	curl $BASE_API/$USER/sensors | jq .
}

update-sensor(){
	curl $BASE_API/$USER/sensors/$1 -H CONTENT_JSON -X PUT | jq .
}

$@
