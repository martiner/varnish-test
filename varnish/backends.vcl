backend j81 {
	.host = "127.0.0.1";
	.port = "8081";
	.connect_timeout = 30s;
	.first_byte_timeout = 120s;
	.between_bytes_timeout = 120s;
	.max_connections = 60;
	.probe = myprobe;
}

backend j82 {
	.host = "127.0.0.1";
	.port = "8082";
	.connect_timeout = 30s;
	.first_byte_timeout = 120s;
	.between_bytes_timeout = 120s;
	.max_connections = 60;
	.probe = myprobe;
}

director my round-robin {
	{ .backend = j81; }
	{ .backend = j82; }
}

sub choose_my_backend {
	set req.backend = my;
}
