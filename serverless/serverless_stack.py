from aws_cdk import (
    Stack,
    aws_lambda as _lambda,
    aws_apigateway as _apigateway
)
from constructs import Construct

class ServerlessStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        gruezer_lambda = _lambda.
