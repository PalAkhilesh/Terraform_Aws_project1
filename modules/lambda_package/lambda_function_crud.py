# import json
# import boto3
# from botocore.exceptions import ClientError
# from decimal import Decimal
# import logging
# import os

# # Initialize the logger
# logger = logging.getLogger()
# logger.setLevel(logging.INFO)

# dynamodb = boto3.resource('dynamodb')
# table_name = os.environ.get('DYNAMODB_TABLE_NAME')
# table = dynamodb.Table(table_name)

# sqs = boto3.client('sqs')
# queue_url = os.environ.get('SQS_QUEUE_URL')
# visibility_timeout = 60

# def order_exists(order_id):
#     response = table.get_item(
#         Key={
#             'order_id': order_id
#         }
#     )
#     return 'Item' in response

# def is_data_same(existing_data, input_data):
#     return (
#         existing_data.get('order_name') == input_data.get('order_name') and
#         existing_data.get('order_quantity') == input_data.get('order_quantity') and
#         existing_data.get('order_price') == Decimal(input_data.get('order_price'))
#     )

# def lambda_handler(event, context):
#     try:
#         for record in event['Records']:
#             message = json.loads(record['body'])
#             logger.info(f"Received message from SQS: {message}")
#             process_message(message)
#     except Exception as e:
#         # Handle exceptions and log errors
#         logger.error(f"Error processing message: {str(e)}")
#         raise e

# def process_message(message):
#     try:
#         logger.info(f"Processing message: {message}")

#         # Check if the message has 'statusCode' and 'body'
#         if 'statusCode' in message and 'body' in message:
#             logger.info("Received response message from SQS. Ignoring.")
#             return {
#                 'statusCode': 200,
#                 'body': 'Received response message from SQS. Ignoring.'
#             }

#         http_method = message.get('httpMethod')

#         if http_method == 'POST':
#             request_body = message['body']

#             try:
#                 order_id = int(request_body['order_id'])
#             except ValueError:
#                 response_message = {
#                     'statusCode': 400,
#                     'body': json.dumps({
#                         'error': 'Invalid value for order_id. It should be an integer.'
#                     })
#                 }
#                 return send_response_to_sqs(response_message)

#             # Validate order_name as string
#             if not isinstance(request_body['order_name'], str) or not request_body['order_name'].isalpha():
#                 response_message = {
#                     'statusCode': 400,
#                     'body': json.dumps({
#                         'error': 'Invalid value for order_name. It should be a string containing only alphabetic characters.'
#                     })
#                 }
#                 return send_response_to_sqs(response_message)

#             # Validate order_quantity as integer
#             try:
#                 order_quantity = int(request_body['order_quantity'])
#             except ValueError:
#                 response_message = {
#                     'statusCode': 400,
#                     'body': json.dumps({
#                         'error': 'Invalid value for order_quantity. It should be an integer.'
#                     })
#                 }
#                 return send_response_to_sqs(response_message)

#             # Validate order_price as decimal
#             try:
#                 order_price = Decimal(request_body['order_price'])
#             except ValueError:
#                 response_message = {
#                     'statusCode': 400,
#                     'body': json.dumps({
#                         'error': 'Invalid value for order_price. It should be a decimal.'
#                     })
#                 }
#                 return send_response_to_sqs(response_message)

#             # Continue with the rest of the processing after validation
#             if order_exists(order_id):
#                 response_message = {
#                     'statusCode': 400,
#                     'body': json.dumps({
#                         'error': 'Order with the given order_id already exists. Please use a different order_id.'
#                     })
#                 }
#             else:
#                 response = table.put_item(
#                     Item={
#                         'order_id': order_id,
#                         'order_name': request_body['order_name'],
#                         'order_quantity': order_quantity,
#                         'order_price': order_price
#                     }
#                 )
#                 response_message = {
#                     'statusCode': 200,
#                     'body': json.dumps({
#                         'message': 'Order created successfully'
#                     })
#                 }

#         elif http_method == 'PUT':
#             request_body = message['body']
#             order_id = request_body['order_id']
#             existing_data = table.get_item(
#                 Key={
#                     'order_id': order_id
#                 }
#             )

#             if 'Item' not in existing_data:
#                 response_message = {
#                     'statusCode': 404,
#                     'body': 'Order not found'
#                 }
#             else:
#                 existing_data = existing_data['Item']
#                 if is_data_same(existing_data, request_body):
#                     response_message = {
#                         'statusCode': 200,
#                         'body': f'The given data for order_id {order_id} is the same as in the database'
#                     }
#                 else:
#                     response = table.update_item(
#                         Key={
#                             'order_id': order_id
#                         },
#                         UpdateExpression='SET order_name = :val1, order_quantity = :val2, order_price = :val3',
#                         ExpressionAttributeValues={
#                             ':val1': request_body['order_name'],
#                             ':val2': request_body['order_quantity'],
#                             ':val3': Decimal(request_body['order_price'])
#                         }
#                     )
#                     response_message = {
#                         'statusCode': 200,
#                         'body': 'Order updated successfully'
#                     }

#         elif http_method == 'DELETE':
#             request_body = message['body']
#             if 'order_id' in request_body:
#                 order_id = request_body['order_id']
#                 existing_order = order_exists(order_id)
#                 if not existing_order:
#                     response_message = {
#                         'statusCode': 404,
#                         'body': 'The given order_id does not exist in the database.'
#                     }
#                 else:
#                     response = table.delete_item(
#                         Key={
#                             'order_id': order_id
#                         }
#                     )
#                     response_message = {
#                         'statusCode': 200,
#                         'body': 'Order deleted successfully'
#                     }
#             else:
#                 response_message = {
#                     'statusCode': 400,
#                     'body': 'Invalid request. The "order_id" parameter is missing in the request body.'
#                 }

#         else:
#             response_message = {
#                 'statusCode': 400,
#                 'body': 'Invalid HTTP method'
#             }

#         return send_response_to_sqs(response_message)

#     except ClientError as e:
#         logger.error(f"Error processing the request: {str(e)}")
#         response_message = {
#             'statusCode': 500,
#             'body': json.dumps({
#                 'error': 'Error processing the request: ' + str(e)
#             })
#         }
#         return send_response_to_sqs(response_message)

#     finally:
#         # Always log when the function completes, even if there's an error
#         logger.info("Processing complete.")

# def send_response_to_sqs(response_message):
#     logger.info(f"Response message: {response_message}")

#     # Send the response back to the SQS queue
#     sqs_response = sqs.send_message(
#         QueueUrl=queue_url,
#         MessageBody=json.dumps(response_message),
#         VisibilityTimeout=visibility_timeout
#     )
#     logger.info(f"Response sent to SQS: {sqs_response}")

#     return {
#         'statusCode': response_message['statusCode'],
#         'body': response_message['body']
#     }
import json
import boto3
from botocore.exceptions import ClientError
from decimal import Decimal
import logging
import os

# Initialize the logger
# Commented out for using print statements
# logger = logging.getLogger()
# logger.setLevel(logging.INFO)

dynamodb = boto3.resource('dynamodb')
table_name = os.environ.get('DYNAMODB_TABLE_NAME')
table = dynamodb.Table(table_name)

sqs = boto3.client('sqs')
queue_url = os.environ.get('SQS_QUEUE_URL')
visibility_timeout = 60

def order_exists(order_id):
    response = table.get_item(
        Key={
            'order_id': order_id
        }
    )
    return 'Item' in response

def is_data_same(existing_data, input_data):
    return (
        existing_data.get('order_name') == input_data.get('order_name') and
        existing_data.get('order_quantity') == input_data.get('order_quantity') and
        existing_data.get('order_price') == Decimal(input_data.get('order_price'))
    )

def lambda_handler(event, context):
    try:
        for record in event['Records']:
            message = json.loads(record['body'])
            # Commented out for using print statements
            # logger.info(f"Received message from SQS: {message}")
            print(f"Received message from SQS: {message}")
            process_message(message)
    except Exception as e:
        # Handle exceptions and log errors
        # Commented out for using print statements
        # logger.error(f"Error processing message: {str(e)}")
        print(f"Error processing message: {str(e)}")
        raise e

def process_message(message):
    try:
        # Commented out for using print statements
        # logger.info(f"Processing message: {message}")
        print(f"Processing message: {message}")

        # Check if the message has 'statusCode' and 'body'
        if 'statusCode' in message and 'body' in message:
            # Commented out for using print statements
            # logger.info("Received response message from SQS. Ignoring.")
            print("Received response message from SQS. Ignoring.")
            return {
                'statusCode': 200,
                'body': 'Received response message from SQS. Ignoring.'
            }

        http_method = message.get('httpMethod')

        if http_method == 'POST':
            request_body = message['body']

            try:
                order_id = int(request_body['order_id'])
            except ValueError:
                response_message = {
                    'statusCode': 400,
                    'body': json.dumps({
                        'error': 'Invalid value for order_id. It should be an integer.'
                    })
                }
                return send_response_to_sqs(response_message)

            # Validate order_name as string
            if not isinstance(request_body['order_name'], str) or not request_body['order_name'].isalpha():
                response_message = {
                    'statusCode': 400,
                    'body': json.dumps({
                        'error': 'Invalid value for order_name. It should be a string containing only alphabetic characters.'
                    })
                }
                return send_response_to_sqs(response_message)

            # Validate order_quantity as integer
            try:
                order_quantity = int(request_body['order_quantity'])
            except ValueError:
                response_message = {
                    'statusCode': 400,
                    'body': json.dumps({
                        'error': 'Invalid value for order_quantity. It should be an integer.'
                    })
                }
                return send_response_to_sqs(response_message)

            # Validate order_price as decimal
            try:
                order_price = Decimal(request_body['order_price'])
            except ValueError:
                response_message = {
                    'statusCode': 400,
                    'body': json.dumps({
                        'error': 'Invalid value for order_price. It should be a decimal.'
                    })
                }
                return send_response_to_sqs(response_message)

            # Continue with the rest of the processing after validation
            if order_exists(order_id):
                response_message = {
                    'statusCode': 400,
                    'body': json.dumps({
                        'error': 'Order with the given order_id already exists. Please use a different order_id.'
                    })
                }
            else:
                response = table.put_item(
                    Item={
                        'order_id': order_id,
                        'order_name': request_body['order_name'],
                        'order_quantity': order_quantity,
                        'order_price': order_price
                    }
                )
                response_message = {
                    'statusCode': 200,
                    'body': json.dumps({
                        'message': 'Order created successfully'
                    })
                }

        elif http_method == 'PUT':
            request_body = message['body']
            order_id = request_body['order_id']
            existing_data = table.get_item(
                Key={
                    'order_id': order_id
                }
            )

            if 'Item' not in existing_data:
                response_message = {
                    'statusCode': 404,
                    'body': 'Order not found'
                }
            else:
                existing_data = existing_data['Item']
                if is_data_same(existing_data, request_body):
                    response_message = {
                        'statusCode': 200,
                        'body': f'The given data for order_id {order_id} is the same as in the database'
                    }
                else:
                    response = table.update_item(
                        Key={
                            'order_id': order_id
                        },
                        UpdateExpression='SET order_name = :val1, order_quantity = :val2, order_price = :val3',
                        ExpressionAttributeValues={
                            ':val1': request_body['order_name'],
                            ':val2': request_body['order_quantity'],
                            ':val3': Decimal(request_body['order_price'])
                        }
                    )
                    response_message = {
                        'statusCode': 200,
                        'body': 'Order updated successfully'
                    }

        elif http_method == 'DELETE':
            request_body = message['body']
            if 'order_id' in request_body:
                order_id = request_body['order_id']
                existing_order = order_exists(order_id)
                if not existing_order:
                    response_message = {
                        'statusCode': 404,
                        'body': 'The given order_id does not exist in the database.'
                    }
                else:
                    response = table.delete_item(
                        Key={
                            'order_id': order_id
                        }
                    )
                    response_message = {
                        'statusCode': 200,
                        'body': 'Order deleted successfully'
                    }
            else:
                response_message = {
                    'statusCode': 400,
                    'body': 'Invalid request. The "order_id" parameter is missing in the request body.'
                }

        else:
            response_message = {
                'statusCode': 400,
                'body': 'Invalid HTTP method'
            }

        return send_response_to_sqs(response_message)

    except ClientError as e:
        # Commented out for using print statements
        # logger.error(f"Error processing the request: {str(e)}")
        print(f"Error processing the request: {str(e)}")
        response_message = {
            'statusCode': 500,
            'body': json.dumps({
                'error': 'Error processing the request: ' + str(e)
            })
        }
        return send_response_to_sqs(response_message)

    finally:
        # Always log when the function completes, even if there's an error
        # Commented out for using print statements
        # logger.info("Processing complete.")
        print("Processing complete.")

def send_response_to_sqs(response_message):
    # Commented out for using print statements
    # logger.info(f"Response message: {response_message}")
    print(f"Response message: {response_message}")

    # Send the response back to the SQS queue
    sqs_response = sqs.send_message(
        QueueUrl=queue_url,
        MessageBody=json.dumps(response_message),
        VisibilityTimeout=visibility_timeout
    )
    # Commented out for using print statements
    # logger.info(f"Response sent to SQS: {sqs_response}")
    print(f"Response sent to SQS: {sqs_response}")

    return {
        'statusCode': response_message['statusCode'],
        'body': response_message['body']
    }
