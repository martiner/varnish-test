mvn clean package
java -DPORT=8081 -jar target/dependency/jetty-runner.jar --port 8081 target/*.war
java -DPORT=8082 -jar target/dependency/jetty-runner.jar --port 8082 target/*.war

GET 'http://localhost/wait?sleep=30'

backend.list
backend.set_health j81 Sick
