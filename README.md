# Varnish backends test

Compile and run backends:

```bash
mvn clean package
java -DPORT=8081 -jar target/dependency/jetty-runner.jar --port 8081 target/*.war
java -DPORT=8082 -jar target/dependency/jetty-runner.jar --port 8082 target/*.war
```

Run Varnish using config in [varnish](varnish) - Varnish listens on port 80.


Now is time to play around

```bash
GET 'http://localhost/wait?sleep=30'

varnishadm backend.list
varnishadm backend.set_health j81 Sick
```
