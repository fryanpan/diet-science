import { APIGatewayEvent, Context, Handler, Callback } from 'aws-lambda';

export const healthCheck: Handler = (event: APIGatewayEvent, 
        context: Context, callback: Callback) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify({
        message: `Hello, the current time is ${new Date().toTimeString()}.`,
        }),
    };

    callback(null, response);
};