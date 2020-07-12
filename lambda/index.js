exports.handler = async (event) => {
  const request = event.Records[0].cf.request;

  let host = request.headers.host[0].value

  const body = `
<\!DOCTYPE html>
<html lang="en">
<head><title>301 Moved Permanently</title></head>
<body bgcolor="white">
<center><h1>301 Moved Permanently</h1></center>
<hr><center>CloudFront Lambda@Edge</center>
</body>
</html>
`;

  if (host.split('.').length == 2) {
    return {
      status: '301',
      statusDescription: `Redirecting to www domain`,
      headers: {
        location: [{
          key: 'Location',
          value: `https://www.${host}${request.uri}`
        }]
      },
      body: body
    };
  }
  return request;
};