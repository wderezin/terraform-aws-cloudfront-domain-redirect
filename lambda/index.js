exports.handler = async (event) => {
  const request = event.Records[0].cf.request;

  let host = request.headers.host[0].value

  if (host.split('.').length == 2) {
    return {
      status: '301',
      statusDescription: `Redirecting to www domain`,
      headers: {
        location: [{
          key: 'Location',
          value: `https://www.${host}${request.uri}`
        }]
      }
    };
  }
  return request;
};