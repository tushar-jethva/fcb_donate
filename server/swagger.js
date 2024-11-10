const swaggerAutogen = require('swagger-autogen')({openapi: '3.0.2'});
;

const doc = {
  info: {
    title: 'API Documentation',
    version: '1.0.0',
  },
  host: 'localhost:3000',
  schemes: ['http'],
  components: {
    parameters: {
      couponCode: {
        name: 'coupon_code',
        in: 'query',
        required: true,
        schema: {
          type: 'string',
          description: 'The coupon code to be validated',
        },
      },
    },
    schemas: {
      CheckCouponResponse: {
        type: 'object',
        properties: {
          valid: {
            type: 'boolean',
            example: true,
          },
          discount: {
            type: 'number',
            example: 10,
          },
        },
      },
      ErrorResponse: {
        type: 'object',
        properties: {
          message: {
            type: 'string',
            example: 'Invalid coupon code',
          },
        },
      },
    },
    responses: {
      SuccessResponse: {
        description: 'Successful response',
        content: {
          'application/json': {
            schema: {
              $ref: '#/components/schemas/CheckCouponResponse',
            },
          },
        },
      },
      ClientErrorResponse: {
        description: 'Client error',
        content: {
          'application/json': {
            schema: {
              $ref: '#/components/schemas/ErrorResponse',
            },
          },
        },
      },
      ServerErrorResponse: {
        description: 'Server error',
        content: {
          'application/json': {
            schema: {
              $ref: '#/components/schemas/ErrorResponse',
            },
          },
        },
      },
    },
  },
  paths: {
    '/b/calculate_cost/apply-coupon': {
      get: {
        summary: 'Check coupon code',
        description: 'Applies a coupon code to calculate the cost',
        operationId: 'applyCoupon',
        parameters: [
          {
            $ref: '#/components/parameters/couponCode',
          },
        ],
        responses: {
          '200': {
            $ref: '#/components/responses/SuccessResponse',
          },
          '400': {
            $ref: '#/components/responses/ClientErrorResponse',
          },
          '500': {
            $ref: '#/components/responses/ServerErrorResponse',
          },
        },
      },
    },
  },
};

  
  const outputFile = './swagger-output.json';
  const routes = ['./routes/*.js'];
  
  /* NOTE: If you are using the express Router, you must pass in the 'routes' only the 
  root file where the route starts, such as index.js, app.js, routes.js, etc ... */
  
  swaggerAutogen(outputFile, routes, doc);