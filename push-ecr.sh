
#!/usr/bin/env sh

eval $(aws ecr get-login --region $AWS_DEFAULT_REGION)
docker push $DEV_AWS_ECR_URI:$CIRCLE_SHA1

sleep 20
exit 0
