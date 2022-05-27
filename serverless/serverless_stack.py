from aws_cdk import (
    Stack,
    aws_lambda as _lambda,
    aws_apigateway as apigateway
)
from constructs import Construct

import os

dir_path = os.path.dirname(os.path.realpath(__file__))


class ServerlessStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # greetings lambda function
        greetings_function = _lambda.Function(
            self, id='greetings_lambda',
            function_name='greet_user',
            code=_lambda.Code.from_asset(os.path.join(dir_path, '..', 'lambda', 'greetings', 'greetings.zip')),
            handler='greetings.handler'
        )

      
        # API Gateway rest api (as a proxy to the lambda defined above)
        apigateway.LambdaRestApi(
            self,
            id='greetings_api', 
            rest_api_name='greetings',
            handler=greetings_function,
            proxy=False
            )

