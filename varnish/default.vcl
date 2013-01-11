import std;

probe myprobe
{
	.threshold = 1;
	.window = 1;
	.timeout = 10s;
	.interval = 60s;
	.expected_response = 404;
	.request =
		"GET / HTTP/1.0"
		"User-Agent: Varnish"
		"Connection: close"
		"Accept: text/plain;*/*";
}

sub vcl_recv
{
	call choose_my_backend;
	if (req.http.Transfer-Encoding == "chunked") {
		return (pipe);
	}

	return (pass);
}

sub vcl_deliver
{
	if (resp.status == 503 || resp.status == 502) {
		# Maybe another backend is alive?
		return (restart);
	}
	return (deliver);
}

include "backends.vcl";
