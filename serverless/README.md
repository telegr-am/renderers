# Serverless Renderer

This renderer uses the [Serverless](https://serverless.com) framework
to deploy a serverless app and then wire up the endpoints
of the deployment to your Telegram
app such that your Telegram app proxies the
HTTPS requests to the target back end.

https://serverless.com/framework/docs/providers/aws/guide/credentials/

```
Serverless: Stack update finished...
Service Information
service: serverless-hello-world
stage: dev
region: us-east-1
stack: serverless-hello-world-dev
api keys:
  None
endpoints:
  GET - https://mj3xw9ab85.execute-api.us-east-1.amazonaws.com/dev/hello-world
functions:
  helloWorld: serverless-hello-world-dev-helloWorld

```
