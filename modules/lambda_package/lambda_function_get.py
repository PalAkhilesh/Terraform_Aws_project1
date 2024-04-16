import json
import boto3
from botocore.exceptions import ClientError
from decimal import Decimal
import os
 
dynamodb = boto3.resource('dynamodb')
table_name = os.environ.get('DYNAMODB_TABLE_NAME')
table = dynamodb.Table(table_name)
 
 
def decimal_default(obj):
    if isinstance(obj, Decimal):
        return str(obj)
    raise TypeError
 
 
def lambda_handler(event, context):
    try:
        if 'queryStringParameters' in event and 'order_id' in event['queryStringParameters']:
            order_id = int(event['queryStringParameters']['order_id'])
            response = table.get_item(
                Key={
                    'order_id': order_id
                }
            )
            item = response.get('Item')
            if item:
                return {
                    'statusCode': 200,
                    'body': json.dumps(item, default=decimal_default)
                }
            else:
                return {
                    'statusCode': 404,
                    'body': json.dumps('Order not found')
                }
        else:
            return {
                'statusCode': 400,
                'body': json.dumps('Invalid request. The "order_id" parameter is missing or not a valid number.')
            }
    except ValueError:
        return {
            'statusCode': 400,
            'body': json.dumps('Invalid order_id. Please provide a valid number.')
        }
    except ClientError as e:
        return {
            'statusCode': 500,
            'body': json.dumps('Error retrieving the order: ' + str(e))
        }